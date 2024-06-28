class UserBook < ApplicationRecord
    validates :user_id, :book_id, :status, presence: true
end
