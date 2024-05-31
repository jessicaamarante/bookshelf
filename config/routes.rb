Rails.application.routes.draw do
  devise_for :users
  get '/books', to: 'books#index'
  post '/want_to_read', to: 'books#want_to_read'
  
  root "books#index"
end
