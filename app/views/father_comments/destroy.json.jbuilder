json.messages '删除成功'
json.father_comment do
  json.call(@father_comment, :id, :article_id, :content, :user_id, :confirm, :publish_at)
end
