class User < ApplicationRecord
    has_many :coffee_breaks, foreign_key: :user_1
    has_many :breaks, through: :coffee_breaks, foreign_key: :user_1, source: :user_2

    has_secure_password
    validates :username, uniqueness: true
end
