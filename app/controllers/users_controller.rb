class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    @tweets = @user.tweets.order(created_at: :desc)
    @like_tweets = @user.like_tweets
    @liked = 0
    @tweets.each do |tweet|
      @liked += tweet.likes.count
    end
  end

  def like_tweets
    @like_tweets = @user.like_tweets
  end

  def search
  end

  def information
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
