json.comments do
  json.array! @comments[:father_comments], :id, :user_id, :content, :publish_data
end
