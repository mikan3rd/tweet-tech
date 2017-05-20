Rails.application.routes.draw do
  devise_for :users
  resources :tweets
  resources :users, only: [:show] do
    collection do
      get 'search'
      get 'information'
    end
  end
  root 'tweets#index'
end
