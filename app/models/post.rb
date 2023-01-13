class Post < ApplicationRecord
 # before_save :set_id
  has_many :comments
  has_one_attached :image
  belongs_to :user
end
