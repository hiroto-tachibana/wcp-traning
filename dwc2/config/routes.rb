Rails.application.routes.draw do

  
  root to: 'home#index'
  devise_for :users
  resources :books
  resources :post_images, only: [:new, :create, :index, :show]

  resources :users, only: [:show, :edit, :update, :index]
    resources :books, only: [:show, :edit, :update, :index]
  


end
