# c = Cuisine.new(name: "american")
# c.save 

# c = Cuisine.new(name: "asian")
# c.save 

# c = Cuisine.new(name: "bbq")
# c.save

# c = Cuisine.new(name: "mexican")
# c.save

# c = Cuisine.new(name: "fast-food")
# c.save 
 
# c = Cuisine.new(name: "vegan")
# c.save

# c = Cuisine.new(name: "indian")
# c.save

# c = Cuisine.new(name: "greek")
# c.save 

# c = Cuisine.new(name: "italian")
# c.save 


# Raked to db sunday 6/17
# r = Restaurant.new(name: "chipotle", star_rating: 3.5, price_rating: 1, address: "6 w grand ave", city: "chicago", zip: "60611", phone_number: "3128280613")
# r.save 

# r = Restaurant.new(name: "roka akor", star_rating: 5, price_rating: 3, address: "456 n clark st", city: "chicago", zip: "60654", phone_number: "3124777652")
# r.save 

# r = Restaurant.new(name: "ramen san", star_rating: 4.5, price_rating: 2, address: "59 w hubbard st", city: "chicago", zip: "60654", phone_number: "3123779950")
# r.save 

# r = Restaurant.new(name: "topo gigio", star_rating: 4.2, price_rating: 2, address: "1516 n wells st", city: "chicago", zip: "60610", phone_number: "3122669355")
# r.save 

# r = Restaurant.new(name: "pink taco", star_rating: 3.5, price_rating: 2, address: "431 n wells st", city: "chicago", zip: "60654", phone_number: "3122125566")
# r.save 


# ----------------------------------------------------------------------------
# Populate database with Axios Call from Yelp API
client_params = {
                  term: "dinner",
                  location: "60654",
                  limit: 50,
                  price: "1,2",
                  # open_at: 1531850400,
                  radius: 10000
                  }

response = Unirest.get(
                        "https://api.yelp.com/v3/businesses/search",
                        headers: {"Authorization" => "Bearer #{ENV['API_KEY']}"},
                        parameters: client_params
                      )

results = response.body

results['businesses'].each_with_index do |restaurant, index|

  restaurant_new = {      
                  "name" => restaurant['name'],
                  "star_rating" => restaurant['rating'],
                  "price_rating" => restaurant['price'].length,
                  "address" => restaurant["location"]['display_address'][0],
                  "city" => restaurant["location"]['display_address'][1].split(",")[0],
                  "zip" => restaurant["location"]['display_address'][1].split(" ")[-1],
                  "url" => restaurant["url"],
                  "phone_number" => restaurant['phone']
                  }
  # p restaurant_new

  puts index if index % 10 == 0
  Restaurant.create!(restaurant_new)
end 














