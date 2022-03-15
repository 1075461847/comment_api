class FatherComment < ApplicationRecord
  validates :article_id, presence: true
  validates :contene, presence: true, length: { maximum: 50, message: '评论超过最大长度（50）' }
  validates :user_id, presence: true
  validates :publish_data, presence: true
  validates :isverify, presence: true, inclusion: { in: [0, 1] }
end
