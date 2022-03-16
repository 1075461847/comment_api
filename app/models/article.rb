class Article < ApplicationRecord
  has_many :father_comments, dependent: :destroy
  has_many :son_comments, dependent: :destroy
end
