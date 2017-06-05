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
    @global = true
    tweet_ids = Like.group(:tweet_id).order('count_tweet_id DESC').limit(10).count(:tweet_id).keys
    @like_tweets = tweet_ids.map { |id| Tweet.find(id) }
  end

  def search_user
    @users_except_me = User.where.not(id: current_user.id)
    @users = @users_except_me.where('nickname LIKE(?)', "%#{params[:user]}%")
    render json: @users
  end

  def search_tweet
    @tweets = Tweet.where('content LIKE(?)', "%#{params[:tweet]}%").order(created_at: :desc)
    respond_to do |format|
      format.json
    end
  end

  private

  def new_tweet
    @new_tweet = Tweet.new
  end

end
