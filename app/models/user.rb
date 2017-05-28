class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # ユーザーネームについて半角英数字と記号（ - _ ）のみ許可
  VALID_EMAIL_REGEX = /\A[\w_-]*[A-Za-z][\w_-]*\z/
  validates :username, format: { with: VALID_EMAIL_REGEX }

  has_many :tweets, dependent: :destroy

  # いいね機能のアソシエーション
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships

  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships

  mount_uploader :icon, IconUploader
  mount_uploader :wallpaper, WallpaperUploader

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

end
