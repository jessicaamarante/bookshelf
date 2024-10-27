class UserFriendship < ApplicationRecord
  # the UserFriendship model belongs to a user and a friend (which is also a User).
  belongs_to :user
  belongs_to :friend, class_name: 'User', foreign_key: :friend_id
end
