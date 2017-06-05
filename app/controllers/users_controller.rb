class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :new_tweet

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc)
    @like_tweets = @user.like_tweets.order(created_at: :desc)
    @liked = 0
    @tweets.each do |tweet|
      @liked += tweet.likes.count
    end
  end

  def follow
    @user = User.find(params[:user_id])
    current_user.follow!(@user)
    redirect_to :back, notice: "フォローしました"
  end

  def unfollow
    @user = User.find(params[:user_id])
    current_user.unfollow!(@user)
    redirect_to :back, notice: "アンフォローしました"
  end

  def search
    tweet_ids = Like.group(:tweet_id).order('count_tweet_id DESC').limit(10).count(:tweet_id).keys
    @like_tweets = tweet_ids.map { |id| Tweet.find(id) }
  end

  private

  def new_tweet
    @new_tweet = Tweet.new
  end

end
