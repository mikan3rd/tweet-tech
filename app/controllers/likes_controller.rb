class LikesController < ApplicationController

  def like
    @tweet = Tweet.find(params[:tweet_id])
    # binding.pry
    @id_name = "#like-link-#{@tweet.id}"
    @id_heart = "#heart-#{@tweet.id}"
    like = current_user.likes.new(tweet_id: @tweet.id)
    if like.save
      # redirect_to :back, notice: "いいね！しました"
    else
      redirect_to :back, alert: "いいね！に失敗しました"
    end
  end

  def unlike
    @tweet = Tweet.find(params[:tweet_id])
    @id_name = "#like-link-#{@tweet.id}"
    @id_heart = "#heart-#{@tweet.id}"
    like = current_user.likes.find_by(tweet_id: @tweet.id)
    if like.destroy
      # redirect_to :back, notice: "いいね！を削除しました"
    else
      redirect_to :back, alert: "いいね！削除に失敗しました"
    end
  end
end
