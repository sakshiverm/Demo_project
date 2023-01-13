class User < ApplicationRecord
    has_secure_password
    has_many :posts
    has_many :comments,through: :posts
    # validates :password, presence: true,length: { minimum: 5}
    # validates :email,presence: true
end
