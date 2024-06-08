Rails.application.routes.draw do
  devise_for :users
  get '/books', to: 'books#index'
  post '/want_to_read', to: 'books#want_to_read'
  get '/my_books', to: 'books#my_books'
  
  root "books#index"
end
