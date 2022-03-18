class User < ApplicationRecord
  validates :name, presence: { message: '用户名不能为空' }, length: { maximum: 50, message: '用户名超过最大长度（10）' }
  has_many :father_comments, -> { order('publish_at DESC') }, dependent: :destroy
  has_many :son_comments, -> { order('publish_at DESC') }, dependent: :destroy
end
