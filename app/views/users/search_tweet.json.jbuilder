json.tweets @tweets.each do |tweet|
  json.nickname   tweet.user.nickname
  json.username   tweet.user.username
  json.date       tweet.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.content    tweet.content
  json.image      tweet.user.icon.thumb.url
  json.id         tweet.id
end
