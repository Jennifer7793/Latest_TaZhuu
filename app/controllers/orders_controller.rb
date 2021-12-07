class OrdersController < ApplicationController
  before_action :authenticate!

  def create
    @course = Course.find(params[:course_id])
    @order = @course.prepare_order(order_params)
    # @order.status = 'pending'

    if @order.save
      #swipe card!
      gateway = Braintree::Gateway.new(
        environment: :sandbox,
        merchant_id: ENV['h8jcptc4t6htzcd5'],
        public_key: ENV['556smdxth5jmr7n5'],
        private_key: ENV['22e781fa3cbddd88134c8e561ae49f85']
      )

      result = gateway.transaction.sale(
        amount: @order.amount, 
        payment_method_nonce: params[:nonce]
      )

      if result.success?
        @order.pay! if@order.may_pay?
        redirect_to root_path, notice: 'Successfully Bought!'
      else
        redirect_to root_path, notice: "sth went wrong, please try again later"
      end
    end
  end

  private
  def order_params
    params.require(:order).permit(:recipient, :address).merge(user: current_user)
  end
end
