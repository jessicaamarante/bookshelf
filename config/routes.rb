Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do

  end

  get '/books', to: 'books#index'
  post '/want_to_read', to: 'books#want_to_read'
  post 'current_read', to: 'books#current_read'
  post 'already_read', to: 'books#already_read'
  get '/show_all_books_by_user', to: 'books#show_all_books_by_user'
  get '/want_to_read_books_list', to: 'books#want_to_read_books_list'
  get '/current_read_books_list', to: 'books#current_read_books_list'
  get '/already_read_books_list', to: 'books#already_read_books_list'

  get '/index', to: 'profile#index', as: 'profile'
  get 'profile/follow/:id', to: 'profile#follow', as: 'follow_user'

  get '/show', to: 'user_friendship#show', as: 'show_user_friendship'

  root "books#index"
end
