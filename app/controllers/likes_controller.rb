class LikesController < ApplicationController
  before_action :set_variables

  def like
    like = current_user.likes.new(tweet_id: @tweet.id)
    if like.save
    else
      redirect_to :back, alert: "いいね！に失敗しました"
    end
  end

  def unlike
    like = current_user.likes.find_by(tweet_id: @tweet.id)
    if like.destroy
    else
      redirect_to :back, alert: "いいね！削除に失敗しました"
    end
  end

  private

  def set_variables
    @tweet = Tweet.find(params[:tweet_id])
    @id_name = "#like-link-#{@tweet.id}"
    @id_heart = "#heart-#{@tweet.id}"
  end

end
