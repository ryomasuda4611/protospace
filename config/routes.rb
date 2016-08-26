Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users
  resources :users, only: [:show, :edit,:update]
  resources :prototypes do
      resources :likes, only: [:create, :destroy], module: :prototypes
      resources :comments, only:[:create, :destroy], module: :prototypes
  end
  resources :popular, only:[:index], module: :prototypes
  resources :tags, only:[:index, :show], module: :prototypes
end
