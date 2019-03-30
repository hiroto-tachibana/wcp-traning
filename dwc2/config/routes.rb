Rails.application.routes.draw do

  
  root to: 'home#index'

  devise_for :users

  resources :books
  resources :users
  resources :post_images


end
