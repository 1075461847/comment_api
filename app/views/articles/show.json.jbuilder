json.count @count
json.father_comments do
  json.array! @father_comments do |father_comment|
    json.call(father_comment, :id, :article_id, :content, :user_id, :confirm, :publish_at)
    json.like_count father_comment.user_likes.count
    json.son_comment_count father_comment.son_comments.confirmed.count
    json.son_comments father_comment.son_comments.confirmed.order(publish_at: :desc)[0, 3], :id, :content,
                      :user_id, :confirm, :publish_at, :reply_user_id
  end
end
