Rails.application.routes.draw do
  root 'top_pages#home'
  get '/about', to: 'top_pages#about'
  get '/service', to: 'top_pages#service'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :account_activations, only: %i[edit]
  resources :password_resets, only: %i[new create edit]
  resources :microposts, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  resources :likes, only: %i[create destroy]
end
