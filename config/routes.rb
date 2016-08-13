Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users
  resources :users, only: [:show, :edit, :index,:update] do
    resources :prototypes, only:[:show, :new, :create, :edit]
  end
end
