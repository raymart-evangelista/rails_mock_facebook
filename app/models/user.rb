class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  has_many :posts
  has_many :friends
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
