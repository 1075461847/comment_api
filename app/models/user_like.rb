class UserLike < ApplicationRecord
  belongs_to :user
  belongs_to :father_comment
end
