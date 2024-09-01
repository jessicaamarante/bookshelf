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

  def current_read
    book = params[:book_id]
    user_book = UserBook.new(user_id: current_user.id, book_id: book, status: "current_read")
    user_book.save!
    flash[:notice] = "Book adding to your current read list"
    redirect_to root_path
  end

  def already_read
    book = params[:book_id]
    user_book = UserBook.new(user_id: current_user.id, book_id: book, status: "already_read")
    user_book.save!
    flash[:notice] = "Book adding to your already read list"
    redirect_to root_path
  end

  def want_to_read_books_list
    books_to_read_by_user = UserBook.want_to_read_books_list(current_user)
    if books_to_read_by_user.present?
      books_list = get_books_for_user(books_to_read_by_user)
      @want_to_read_books = build_book_info(books_list)
    end
  end

  def current_read_books_list
    current_read_by_user = UserBook.get_books_to_list(current_user)
    if current_read_by_user.present?
      books_list = get_books_for_user(current_read_by_user)
      @current_read_books = build_book_info(books_list)
    end
  end

  def already_read_books_list
    already_read_by_user = UserBook.get_read_books_to_list(current_user)
    if already_read_by_user.present?
      books_list = get_books_for_user(already_read_by_user)
      @already_read_books = build_book_info(books_list)
    end
  end

  def show_all_books_by_user
    book_ids = UserBook.get_books(current_user)

    if book_ids.present?
      books_list = get_books_for_user(book_ids)
      @all_books_by_user = build_book_info(books_list)
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

  def build_book_info(books)
    books_to_list = []

    @books.each do |book|
      book_info = {
        id: book['id'],
        title: book['title'],
        author: book['authors'],
        image: book['formats']
      }
      books_to_list << book_info
    end
    books_to_list
  end
end
