# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

# Users
count = 1
loop do
  User.create(name: "用户#{count}")
  count == 20 ? break : count += 1
end

# Articles
count = 1
loop do
  Article.create
  count == 5 ? break : count += 1
end

# FatherComments
article_id = 1
user_id = 1
count = 1
loop do
  FatherComment.create(article_id: article_id, user_id: user_id, publish_at: Time.now, confirm: 'confirmed',
                       content: "这是用户#{user_id}于#{Time.now}在文章#{article_id}发布的评论")
  count += 1
  user_id += 1 if (count % 5).zero?
  if user_id == 21
    article_id += 1
    user_id = 1
  end
  sleep 1
  break if article_id == 5
end

# SonComments
article_id = 1
user_id = 1
reply_user_id = 1
father_comment_id = 1
count = 1
loop do
  SonComment.create(article_id: article_id, user_id: user_id, publish_at: Time.now,
                    father_comment_id: father_comment_id, reply_user_id: reply_user_id,
                    confirm: 'confirmed',
                    content: "这是用户#{user_id}于#{Time.now}在文章#{article_id}中父评论
                    #{father_comment_id}下发布的评论，回复的用户为#{reply_user_id}")
  count += 1
  user_id += 1 if (count % 5).zero?
  if user_id == 21
    reply_user_id += 1
    father_comment_id += 1
    article_id += 1
    user_id = 1
  end
  reply_user_id = 1 if reply_user_id == 21
  sleep 1
  break if article_id == 5
end
