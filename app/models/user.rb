class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy

  after_create :create_profile

  has_many :user_friendships, foreign_key: :user_id, class_name: 'UserFriendship', dependent: :destroy

  # defines a many-to-many relationship between users through the user_friendships join table, allowing you to access a user's friends directly.
  # if i don't have this line, i can't access friends directly from a user, i have to query the user_friendships table to get the friends.
  has_many :friends, through: :user_friendships, source: :friend

  def follow(friend)
    unless self.user_friendships.exists?(friend_id: friend.id)
      self.user_friendships.create(friend_id: friend.id)
    end
  end

  private

  def create_profile
    Profile.create(user_id: self.id)
  end
end
