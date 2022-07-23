Rails.application.routes.draw do
  root 'home#index'

  use_doorkeeper
  resources :reviews
  resources :products

  scope :api, defaults: { format: :json } do
    devise_for :users, controllers: { sessions: :sessions },
                       path_names: { sign_in: :login }

    resource :user, only: [:show, :update]
  end

  draw :api
  
end
