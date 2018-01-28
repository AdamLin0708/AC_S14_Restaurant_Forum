Rails.application.routes.draw do
  devise_for :users
  
  # resources :restaurants, except: [:new, :create, :edit, :update, :destroy]
  root "restaurants#index"

  #restaurants routes
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]

    collection do 
      get :feeds
      get :ranking
    end

    member do
      get :dashboard
      post :favorite
      post :unfavorite
      post :like
      post :unlike
    end

  end

  #categories routes
  resources :categories, only: :show
  
  #users routes
  resources :users, only: [:index, :show, :edit, :update]

  #followship routes
  resources :followships, only: [:create, :destroy]

  #admin
  namespace :admin do

    resources :restaurants
    resources :categories
    root "restaurants#index"

  end
end
