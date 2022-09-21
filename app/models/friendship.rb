class Friendship < ApplicationRecord
  # belongs_to :friends, class_name: "User", foreign_key: :friend_id
  belongs_to :friend_a, foreign_key: :friend_a_id, class_name: :User
  belongs_to :friend_b, foreign_key: :friend_b_id, class_name: :User
end
