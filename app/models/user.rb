class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :posts

  # has_many :friendship_list, foreign_key: :user_id, class_name: "Friendship"
  # has_many :friends, through: :friendship_list

  # has_many :friendship_list, foreign_key: :friend_a_id, class_name: :Friendship
  # has_many :friends, through: :friendship_list

  # User.all_friends(user)
  # scope :all_friends, ->(user) { Friendship.where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id)}

  def friends
    Friendship.where("friend_a_id = ? OR friend_b_id = ?", self.id, self.id)
  end

  def addable_friends
    # an addable friend is someone who meets the following criteria:
      # - the addable friend is not a current friend
      # - the addable friend is not in friend requests
        # - specifically, the addable friend is not a requestor
        # - specifically, the addable friend is not a receiver
  end

  # has_many :friendships, foreign_key: :friend_a_id, class_name: :Friendship
  # has_many :friendships, -> { where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id) }
  # has_many :friends, through: :friendships, source: :Friendship

  # has_many :friendships, ->(user) { where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id) }
  # has_many :friends, through: :friendships

  has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
