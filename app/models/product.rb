class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates_presence_of :description, :title, :price
  validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }, numericality: true

  def average_rating
    reviews.average(:rating)
  end
end
