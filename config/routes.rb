Rails.application.routes.draw do
  root 'top_pages#home'
  get '/about', to: 'top_pages#about'
  get '/service', to: 'top_pages#service'
  get '/signup', to: 'users#new'
  resources :users
end
