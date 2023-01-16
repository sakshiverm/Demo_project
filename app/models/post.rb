
class Post < ApplicationRecord
  has_many :comments
  has_one_attached :image
  belongs_to :user
end
