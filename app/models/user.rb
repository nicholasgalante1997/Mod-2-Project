class User < ApplicationRecord
    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users
    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users
    
    has_many :reviews
    has_many :restaurants, through: :reviews
    has_many :reservations 

    validates :username, uniqueness: :true 
    validates :password, length: { minimum: 4}

    has_secure_password 
    
end
