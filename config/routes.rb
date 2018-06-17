Rails.application.routes.draw do
  post "/users" => "users#create"
  namespace :api do 
    get '/restaurants' => 'restaurants#index'
    get '/restaurants/random' => 'restaurants#random'
  end 
end
