class Api::RestaurantsController < ApplicationController

def index 
  @restaurants = Restaurant.all
  
  render 'index.json.jbuilder'
end

def show 
  restaurant_id = params[:id]
    @restaurant = Restaurant.find(restaurant_id)
    
    render 'show.json.jbuilder'
end   




end
