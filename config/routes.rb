Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :users, only: [:show]
  root 'tweets#index'
end
