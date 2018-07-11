class Api::RestaurantsController < ApplicationController

def index 
  restaurants_arr = []

  client_params = {
                  term: "dinner",
                  location: "60654",
                  limit: 50,
                  price: "1,2",
                  open_now: true,
                  radius: 10000
                  }

response = Unirest.get(
                        "https://api.yelp.com/v3/businesses/search",
                        headers: {"Authorization" => "Bearer S4UbtPRP3UufspNrT7qSHLzygIB0ZmPsaq4S4p9Yz_5GiHnp2R121AN9P08K0HzUcLKFZ7Ttg7bXpslgexQ8uz5wLm7ouwqshKsHJaxvMA_vlpxLYYUu7vU8_f5DW3Yx"},
                        parameters: client_params
                      )

@results = response.body


@results['businesses'].sample(3).each do |restaurant|
  @restaurant = {      
                  "name" => restaurant['name'],
                  "rating" => restaurant['rating'],
                  "address" => restaurant['location']['display_address'],
                  "url" => restaurant['url']
                  }


   restaurants_arr << @restaurant
end 

 @restaurants = restaurants_arr




  # @restaurants = Restaurant.all

  # if params[:random]
  #   @restaurants = Restaurant.order("RANDOM()").limit(3)
  # end
  
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
