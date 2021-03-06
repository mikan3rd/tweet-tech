class TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_action :current_user_confirm, only: [:edit, :update, :destroy]

  # GET /tweets
  # GET /tweets.json
  def index
    ids = current_user.followings.ids
    ids << current_user.id
    @tweets = Tweet.where(user_id: ids).order(created_at: :DESC)
    @new_tweet = Tweet.new
    @global = false
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @liking_users = @tweet.liking_users.order(created_at: :DESC)
    @new_tweet = Tweet.new
  end

  # GET /tweets/new
  def new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = current_user.tweets.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweets_path, notice: 'ツイートを投稿しました' }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'ツイートを編集しました！' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def global
    @global = true
    @tweets = Tweet.order(created_at: :DESC)
    @new_tweet = Tweet.new
    render :index
  end

  private

    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    def tweet_params
      params.require(:tweet).permit(:content, :image)
    end

    def current_user_confirm
      if current_user.id != @tweet.user.id
        redirect_to :back, alert: "あなたはこのツイートの投稿者ではありません"
      end
    end
end
