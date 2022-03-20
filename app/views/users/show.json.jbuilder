json.comments do
  json.father_comment @father_comment, :id, :article_id, :content, :user_id, :confirm, :publish_at
  json.son_comment @son_comment, :id, :content, :father_comment_id, :user_id, :confirm, :publish_at,
                   :reply_user_id
end
