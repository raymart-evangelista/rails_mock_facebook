class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :posts

  has_many :friendship_list, foreign_key: :user_id, class_name: "Friendship"
  has_many :friends, through: :friendship_list

  # scope, add a new friend where Users not in friends and not current user
  def addable_users
    User.where.not(id: self.friends.ids.push(self.id))
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
