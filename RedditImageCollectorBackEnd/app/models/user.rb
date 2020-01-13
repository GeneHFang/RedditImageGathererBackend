class User < ApplicationRecord
    has_secure_password
    has_many :user_images
    has_many :user_subreddits
    has_many :images, through: :user_images
    has_many :subreddits, through: :user_subreddits

    validates :username, uniqueness: true
end
