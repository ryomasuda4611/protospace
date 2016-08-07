Rails.application.routes.draw do
  devise_for :users
 resources :users, only: [:show, :edit, :index,:update]
 root 'prototypes#index'
 get '/prototypes/show' => 'prototypes#show'
 get '/proto/new' => 'prototypes#new'
end
