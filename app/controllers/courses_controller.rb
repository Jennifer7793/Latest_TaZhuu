class CoursesController < ApplicationController
  before_action :set_course, only: [:edit, :update, :destroy]
  before_action :authenticate!, except: [:index, :show]

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])
    @review = Review.new
    @reviews = @course.reviews.order(id: :desc)
  end

  def new
    @course = Course.new
  end

  def buy
    @course = Course.find(params[:id])
    @order = Order.new

    gateway = Braintree::Gateway.new(
      environment: :sandbox,
      merchant_id: ENV['h8jcptc4t6htzcd5'],
      public_key: ENV['556smdxth5jmr7n5'],
      private_key: ENV['22e781fa3cbddd88134c8e561ae49f85']
    )
    @token = gateway.client_token.generate
  end
  
  def create
    @course = current_user.courses.build(course_params)

    if @course.save
      redirect_to courses_path, notice: "新增課程成功"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      redirect_to courses_path, notice: "課程更新成功"
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_path, notice: "課程已刪除"
  end

  private
  def set_course
    @course = current_user.courses.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :price, :intro, :hour)
  end
end
