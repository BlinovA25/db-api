Rails.application.routes.draw do
  # Basic models routes
  resources :notes
  resources :custom_objects
  resources :tg_users

  # Report routes
  scope '/reports' do
    get '/', to: 'reports#existing_reports'
    get '/download/:filename', to: 'reports#download_report'
    get '/download_notes_report.csv', to: 'reports#download_notes_report', format: 'csv'
    get '/generate_notes_report', to: 'reports#generate_notes_report'
  end

  # Token routes
  scope '/tokens' do
    get '/get', to: 'tokens#get'
    get '/check/:token', to: 'tokens#check'
  end

  # Info routes
  get '/info', to: 'application#info' 
  get '/session_info', to: 'application#session_info' 
end
