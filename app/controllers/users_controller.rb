class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc)
    @liked = 0
    @tweets.each do |tweet|
      @liked += tweet.likes.count
    end
  end

  def search
  end

  def information
  end

end
