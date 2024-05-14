Rails.application.routes.draw do
  devise_for :users
  get '/books', to: 'books#index'
  
  root "books#index"
end
