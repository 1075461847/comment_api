json.comments do
  json.father_comments do
    json.array! @comments[:father_comments] do |father_comment|
      json.call(father_comment, :id, :article_id, :content, :user_id, :confirm, :publish_at)
    end
  end
  json.son_comments do
    json.array! @comments[:son_comments] do |son_comment|
      json.call(son_comment, :id, :article_id, :content, :father_comment_id, :user_id, :confirm, :publish_at,
                :reply_user_id)
    end
  end
end
