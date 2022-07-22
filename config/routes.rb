Rails.application.routes.draw do
  root 'home#index'

  use_doorkeeper
  resources :reviews
  resources :products

  draw :api
  
end
