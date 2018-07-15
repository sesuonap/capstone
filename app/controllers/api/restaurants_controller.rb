class Api::RestaurantsController < ApplicationController

def index 
#   @restaurants = []

#   client_params = {
#                   term: "dinner",
#                   location: "60654",
#                   limit: 50,
#                   price: "1,2",
#                   open_now: true,
#                   radius: 10000
#                   }

# response = Unirest.get(
#                         "https://api.yelp.com/v3/businesses/search",
#                         headers: {"Authorization" => "Bearer #{ENV['API_KEY']}"},
#                         parameters: client_params
#                       )

# results = response.body


# results['businesses'].sample(3).each do |restaurant|
#   restaurant = {      
#                   "name" => restaurant['name'],
#                   "rating" => restaurant['rating'],
#                   "address" => restaurant['location']['display_address'],
#                   "url" => restaurant['url']
#                   }


#    @restaurants << restaurant
# end 

  @restaurants = Restaurant.all.sample(3)

  render 'index.json.jbuilder'
end

def show 
  restaurant_id = params[:id]
    @restaurant = Restaurant.find(restaurant_id)
    
    render 'show.json.jbuilder'
end  

def random 







  # Create method to randomize restaurants and show 3 to page. 
  # @restaurants = Restaurant.order("RANDOM()").limit(3)

  # render 'index.json.jbuilder'
end 







end
