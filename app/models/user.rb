class User < ApplicationRecord
    has_secure_password

    validates :first_name, presence: true
    validates :password, uniqueness: true, presence: true,length: { minimum: 5}
    validates :email,presence: true, uniqueness: true
end
