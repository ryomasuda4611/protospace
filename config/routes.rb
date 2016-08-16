Rails.application.routes.draw do
  root 'prototypes#index'
  devise_for :users
  resources :users, only: [:show, :edit,:update] do
    resources :prototypes, except: [:index]
  end
end
