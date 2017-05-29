Rails.application.routes.draw do
  devise_for :users

  resources :tweets do
    collection do
      get :global
    end
  end

  resources :users, only: [:show] do
    member do
      get :following
      get :followers
    end
    collection do
      get :search
    end
  end

  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'

  post   '/follow/:user_id' => 'users#follow', as: 'follow'
  delete '/follow/:user_id' => 'users#unfollow', as: 'unfollow'

  root 'tweets#index'
end
