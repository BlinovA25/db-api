Rails.application.routes.draw do
  get 'tokens/get'
  get 'tokens/check'
  # Defines the root path route ("/")
  # root "articles#index"

  # Basic models routes
  resources :notes

  # Token routes
  scope '/tokens' do
    get '/get', to: 'tokens#get'
    get '/check/:token', to: 'tokens#check'
  end

  # Info routes
  get '/info', to: 'application#info' 
  get '/session_info', to: 'application#session_info' 
end
