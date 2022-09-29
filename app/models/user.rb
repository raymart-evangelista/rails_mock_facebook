class User < ApplicationRecord
  extend FriendlyId
  friendly_id :username, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :posts
  has_many :likes
  has_many :comments

  # has_many :friendship_list, foreign_key: :user_id, class_name: "Friendship"
  # has_many :friends, through: :friendship_list

  # has_many :friendship_list, foreign_key: :friend_a_id, class_name: :Friendship
  # has_many :friends, through: :friendship_list

  # User.all_friends(user)
  # scope :all_friends, ->(user) { Friendship.where("friend_a_id = ? OR friend_b_id = ?", user.id, user.id)}

  def friends
    Friendship.where("friend_a_id = ? OR friend_b_id = ?", self.id, self.id)
  end

  def friends_ids
    curr_friend_ids = friends.pluck(:friend_a_id) + friends.pluck(:friend_b_id)
    curr_friend_ids.delete(self.id)
    curr_friend_ids
  end

  def unaddable_ids
    # an addable friend is someone who meets the following criteria:
      # - the addable friend is not a current friend
      # - the addable friend is not in friend requests
        # - specifically, the addable friend is not a requestor
        # - specifically, the addable friend is not a receiver
    curr_friend_ids = friends.pluck(:friend_a_id) + friends.pluck(:friend_b_id)
    curr_friend_requests = friend_requests_as_requestor.pluck(:receiver_id) + friend_requests_as_receiver.pluck(:requestor_id)
    unaddable = curr_friend_ids + curr_friend_requests
    unaddable.delete(self.id)
    unaddable
  end

  def addable_friends
    User.where.not(id: self.unaddable_ids << self.id)
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
