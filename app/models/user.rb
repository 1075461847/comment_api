class User < ApplicationRecord
  validates :name, presence: { message: '用户名不能为空' }, length: { maximum: 10, message: '用户名超过最大长度（10）' }
  has_many :father_comments, dependent: :destroy
end
