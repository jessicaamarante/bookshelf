require 'faraday'
require 'devise'

class BooksController < ApplicationController

  def index
    connection = Faraday.new(url: 'http://gutendex.com')
    response = connection.get('/books/')
    body_json = JSON.parse(response.body)

    @books = body_json['results']
    @books_info = []

    @books.each do |book|
      book_info = {
        id: book['id'],
        title: book['title'],
        author: book['authors'],
        image: book['formats']
      }
      @books_info << book_info
    end
  end

  def want_to_read
    book = params[:book_id]
    user_book = UserBook.new(user_id: current_user.id, book_id: book, status: "want_to_read")
    user_book.save!
    flash[:notice] = "Book adding to your want to read list"
    redirect_to root_path

  end

  def my_books

  end
end
