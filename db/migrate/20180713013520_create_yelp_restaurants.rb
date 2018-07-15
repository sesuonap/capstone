class CreateYelpRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :yelp_restaurants do |t|
      t.string :name
      t.string :rating
      t.string :address
      t.string :url

      t.timestamps
    end
  end
end
