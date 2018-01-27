Rails.application.routes.draw do
  devise_for :users
  
  # resources :restaurants, except: [:new, :create, :edit, :update, :destroy]
  root "restaurants#index"

  #restaurants routes
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
  end

  #categories routes
  resources :categories, only: :show
  
  #users routes
  resources :users, only: [:show, :edit, :update]

  #admin
  namespace :admin do

    resources :restaurants
    resources :categories
    root "restaurants#index"

  end
end
