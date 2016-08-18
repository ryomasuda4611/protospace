Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users
  resources :users, only: [:show, :edit,:update]
  resources :prototypes, except: [:index]
end
