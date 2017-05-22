class LikesController < ApplicationController

  def like
    tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.new(tweet_id: tweet.id)
    if like.save
      redirect_to root_path, notice: "いいね！しました"
    else
      redirect_to root_path, alert: "いいね！できませんでした"
    end
  end

  def unlike
    tweet = Tweet.find(params[:tweet_id])
    like = current_user.likes.find_by(tweet_id: tweet.id)
    if like.destroy
      redirect_to root_path, notice: "いいね！を削除しました"
    else
      redirect_to root_path, alert: "いいね！を削除できませんでした"
    end
  end
end
