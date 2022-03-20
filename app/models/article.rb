class Article < ApplicationRecord
  has_many :father_comments, dependent: :destroy
end
