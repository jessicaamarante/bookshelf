require 'faraday'

class BooksController < ApplicationController

  def index
    connection = Faraday.new(url: 'http://gutendex.com')
    response = connection.get('/books/')
    body_json = JSON.parse(response.body)
    debugger

    @books = body_json['results']

    @books.each do |book|
      title = book['title']
    end
  end
end
