Rails.application.routes.draw do
  # Defines the root path route ("/")
  # root "articles#index"

  # Basic models routes
  resources :notes

  # Token routes

  # Info routes
  get '/info', to: 'application#info' 
  get '/session_info', to: 'application#session_info' 
end
