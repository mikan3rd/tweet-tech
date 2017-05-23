Rails.application.routes.draw do
  devise_for :users
  resources :tweets do
    member do
      get :liking_users
    end
  end
  resources :users, only: [:show] do
    member do
      get :like_tweets
    end
    collection do
      get 'search'
      get 'information'
    end
  end
  post   '/like/:tweet_id' => 'likes#like',   as: 'like'
  delete '/like/:tweet_id' => 'likes#unlike', as: 'unlike'
  root 'tweets#index'
end
