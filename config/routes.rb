Rails.application.routes.draw do
  devise_for :users
 root 'prototypes#index'
 get '/prototypes/show' => 'prototypes#show'
 get '/proto/new' => 'prototypes#new'
end
