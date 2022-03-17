class FatherComment < ApplicationRecord
  enum confirm: { need_confirm: 0, confirmed: 1, unconfirmed: 2 }

  validates :article_id, :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250, message: '评论超过最大长度（50）' }
  validates :publish_at, presence: true
  validates :confirm, presence: true, inclusion: { in: %w[need_confirm confirmed unconfirmed] }
  has_many :son_comments, dependent: :destroy
  belongs_to :user
  belongs_to :article
end
