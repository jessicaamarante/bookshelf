Rails.application.routes.draw do
  devise_for :users
  get '/books', to: 'books#index'
  post '/want_to_read', to: 'books#want_to_read'
  get '/show_all_books_by_user', to: 'books#show_all_books_by_user'
  get '/want_to_read_books_list', to: 'books#want_to_read_books_list'

  root "books#index"
end
