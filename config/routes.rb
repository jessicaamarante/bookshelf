Rails.application.routes.draw do
  devise_for :users

  get '/books', to: 'books#index'
  post '/want_to_read', to: 'books#want_to_read'
  post 'current_read', to: 'books#current_read'
  post 'already_read', to: 'books#already_read'
  get '/show_all_books_by_user', to: 'books#show_all_books_by_user'
  get '/want_to_read_books_list', to: 'books#want_to_read_books_list'
  get '/current_read_books_list', to: 'books#current_read_books_list'
  get '/already_read_books_list', to: 'books#already_read_books_list'

  get '/profile', to: 'profile#profile'

  root "books#index"
end
