class Friendship < ApplicationRecord
  belongs_to :friends, class_name: "User", foreign_key: :friend_id
end
