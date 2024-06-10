class UserBook < ApplicationRecord
    validates :user_id, :user_book, :status, presence: true
end
