Rails.application.routes.draw do
  get '/books', to: 'books#index'
  
  root "books#index"
end
