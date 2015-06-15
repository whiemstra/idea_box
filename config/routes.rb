Rails.application.routes.draw do

  resources :categories
  resources :ideas

  root to: 'categories#index'
end
