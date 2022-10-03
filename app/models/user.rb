class User < ApplicationRecord
  include Gravtastic
  extend FriendlyId
  gravtastic size: 60
  friendly_id :username, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  # validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :posts
  has_many :likes
  has_many :comments

  has_many :friend_requests_as_requestor, foreign_key: :requestor_id, class_name: :FriendRequest
  has_many :friend_requests_as_receiver, foreign_key: :receiver_id, class_name: :FriendRequest

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook]

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

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      # note that the block executes ONLY if a new instance is being created
      # see https://apidock.com/rails/ActiveRecord/Relation/first_or_create
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      # user.first_name = auth.info.first_name
      # user.last_name = auth.info.last_name
      # user.image = auth.info.image
    end
  end
end
