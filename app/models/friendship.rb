class Friendship < ApplicationRecord
  # belongs_to :friends, class_name: "User", foreign_key: :friend_id
  belongs_to :friend_a, class_name: :User
  belongs_to :friend_b, class_name: :User
end
