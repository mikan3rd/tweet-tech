class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @tweets = current_user.tweets.order(created_at: :desc)
  end

  def search
  end

  def information
  end

end
