class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates_presence_of :content, :rating, :user_id

  default_scope { order('created_at DESC') }
end
