class Course < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true, numericality: {
    greater_than_or_equal_to: 0
  }

  belongs_to :user
  has_many :reviews
  has_many :orders
  
  has_many :fav_courses
  has_many :users, through: :fav_courses

  def prepare_order(params)
    params = params.merge(
      amount: self.price, 
      status: 'pending'
    )
    orders.build(params)
  end
end
