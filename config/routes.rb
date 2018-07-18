Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'

  post "/users" => "users#create"
  get '/users/current' => 'users#show'
  patch "/users/current" => "users#update"

  namespace :api do 
    get '/restaurants' => 'restaurants#index'
    get '/restaurants/random' => 'restaurants#random'
    get '/restaurants/:id' => 'restaurants#show'
    post '/pizzas' => 'pizzas#create'
  end 
end
