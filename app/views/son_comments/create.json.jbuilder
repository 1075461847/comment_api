json.son_comment do
  json.call(@son_comment, :id, :article_id, :content, :father_comment_id, :user_id, :confirm, :publish_at,
            :reply_user_id)
end
