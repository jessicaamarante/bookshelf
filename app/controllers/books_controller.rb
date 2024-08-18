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

  def show_my_books
    book_ids = UserBook.get_books(current_user)

    @books_to_list = []

    if book_ids.present?
      @books_to_show = get_books_for_user(book_ids)

      @books_to_show.each do |book|
        book_info = {
          id: book['id'],
          title: book['title'],
          author: book['authors'],
          image: book['formats']
        }
        @books_to_list << book_info
      end
    end
  end

  def get_books_for_user(book_ids)
    connection = Faraday.new(url: 'https://gutendex.com')

    @books = []

    book_ids.each do |book_id|
      response = connection.get("/books/#{book_id}/")
      if response.status == 200
        parsed_books = JSON.parse(response.body)
        @books << parsed_books
      end
    end
    @books
  end
end
