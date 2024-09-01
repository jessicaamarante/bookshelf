class UserBook < ApplicationRecord
  validates :user_id, :book_id, :status, presence: true

  # queria criar um scope para buscar no banco livros com status want_to_read para um usuario especifico - ver depois como poderia ter feito aqui
  # scope :want_to_read_books, -> { where(status: 'want_to_read') }

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

    def want_to_read_books_list(current_user)
      books_to_read = []
      user = current_user

      to_read_books = UserBook.where(["user_id = ? and status = ?", user, "want_to_read"])

      to_read_books.each do |book|
        books_to_read << book.book_id
      end

      books_to_read
    end

    def get_books_to_list(current_user)
      current_read = []
      user = current_user

      current_read_books = UserBook.where(["user_id = ? and status = ?", user, "current_read"])

      current_read_books.each do |book|
        current_read << book.book_id
      end

      current_read
    end
  end
end
