Rails.application.routes.draw do
 root 'prototypes#index'
 get '/prototypes/show' => 'prototypes#show'
 get '/proto/new' => 'prototypes#new'
end
