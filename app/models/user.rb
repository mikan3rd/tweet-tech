class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets
  has_many :likes
  has_many :like_tweets, through: :likes, source: :tweet

  VALID_EMAIL_REGEX = /\A[\w_-]*[A-Za-z][\w_-]*\z/
  validates :username, format: { with: VALID_EMAIL_REGEX }

end
