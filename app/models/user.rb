class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :firstname, :lastname

  has_many :reviews
  has_many :products

  def is_product_owner?(product)
    self == product.user
  end

  def recent_reviews
    reviews.order('created_at DESC').limit(5)
  end
end
