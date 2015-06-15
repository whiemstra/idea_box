Rails.application.routes.draw do

  resources :categories
  resources :ideas
  resources :users

  root to: 'categories#index'


  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
