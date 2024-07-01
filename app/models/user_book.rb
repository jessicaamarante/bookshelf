class UserBook < ApplicationRecord
  validates :user_id, :book_id, :status, presence: true
  class << self
    def get_books(current_user)
      books = []
      user = current_user

      books_by_user = UserBook.where("user_id = ?", user)

      books_by_user.each do |book|
        books << book.book_id
      end

      books
    end
  end
end
