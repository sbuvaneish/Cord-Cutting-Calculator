Rails.application.routes.draw do

  root 'pages#home'

  get '/scrape', to: 'scrapers#select_package'
  get '/scrape/:service', to: 'scrapers#show_package'
  post '/scrape/:service', to: 'scrapers#show_package'

  resources :devices
  resources :set_top_boxes
  resources :packages
  resources :channels
  resources :users
  resources :password_resets

  get '/home', to: 'pages#home'

  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  get '/antenna/:id', to: 'antennas#show', as: 'antenna'
  post '/antenna/:id', to: 'antennas#update_antenna', as: 'update_antenna'

  get '/own_boxes/:id', to: 'own_boxes#show', as: 'own_box'
  post '/own_boxes/:id', to: 'own_boxes#update_own_set_top_box', as: 'update_own_box'

  get '/own_device/:id', to: 'own_devices#show', as: 'own_device'
  post '/own_device/:id', to: 'own_devices#update_own_device', as: 'update_own_device'

  get '/package/select_origin', to: 'packages#select_origin', as: 'select_origin'
  get '/package/new_hierarchical/:id', to: 'packages#new_hierarchical', as: 'hierarchical_new'

  get '/users/:id/calculator', to: 'users#calculator', as: 'calculator'
  post '/users/:id/calculator', to: 'users#calculate', as: 'calculate'

  
  get '/users/:id/result/:flag_one_pack/:flag_dvr/:budget',to:'users#result', as:'result'
  post '/users/:id/result/:flag_one_pack/:flag_dvr/:budget',to:'users#pdfgen', as:'pdfgen'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
