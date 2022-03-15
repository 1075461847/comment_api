class FatherComment < ApplicationRecord
  validates :article_id, presence: true
  validates :content, presence: true, length: { maximum: 50, message: '评论超过最大长度（50）' }
  validates :user_id, presence: true
  validates :publish_data, presence: true
  validates :isverify, presence: true, inclusion: { in: [0, 1] }
  belongs_to :user

  scope :with_article, lambda { |article_id|
                         where(article_id: article_id, isverify: 1).order(publish_data: :desc) if article_id.present?
                       }
  scope :not_verify, -> { where(isverify: 0) }
end
