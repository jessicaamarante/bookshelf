require 'faraday'

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
  end
end
