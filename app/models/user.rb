class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one :profile

has_many :friendships,
          foreign_key: :user_id,
          class_name: 'UserFriendship',
          dependent: :destroy

  def follow(friend)
    unless self.friendships.exists?(friend_id: friend.id)
      self.friendships.create(friend_id: friend.id)
    end
  end
end
