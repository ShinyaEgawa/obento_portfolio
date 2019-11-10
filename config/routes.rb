Rails.application.routes.draw do
  root 'top_pages#home'
  get 'sessions/new', to: 'sessions#new'
  get '/about', to: 'top_pages#about'
  get '/service', to: 'top_pages#service'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users
  resources :account_activations, only: [:edit]
end
