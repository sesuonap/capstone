class Api::RestaurantsController < ApplicationController

def index 
  @restaurants = Restaurant.all

  if params[:random]
    @restaurants = Restaurant.order("RANDOM()").limit(3)
  end
  
  render 'index.json.jbuilder'
end

def show 
  restaurant_id = params[:id]
    @restaurant = Restaurant.find(restaurant_id)
    
    render 'show.json.jbuilder'
end  

def random 
  # Create method to randomize restaurants and show 3 to page. 
  @restaurants = Restaurant.order("RANDOM()").limit(3)

  render 'index.json.jbuilder'
end 





end
