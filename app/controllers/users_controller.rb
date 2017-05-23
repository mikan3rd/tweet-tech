class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :new_tweet

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc)
    @like_tweets = @user.like_tweets
    @liked = 0
    @tweets.each do |tweet|
      @liked += tweet.likes.count
    end
  end

  def search
  end

  def information
  end

  private

  def new_tweet
    @new_tweet = Tweet.new
  end

end
