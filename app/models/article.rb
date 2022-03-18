class Article < ApplicationRecord
  has_many :father_comments, -> { order('publish_at DESC') }, dependent: :destroy
  has_many :son_comments, -> { order('publish_at DESC') }, dependent: :destroy
end
