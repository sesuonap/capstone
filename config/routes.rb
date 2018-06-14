Rails.application.routes.draw do
  post "/users" => "users#create"
  namespace :api do 
    get '/restaurants' => 'restaurants#index'
  end 
end
