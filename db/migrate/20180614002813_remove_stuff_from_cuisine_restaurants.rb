class RemoveStuffFromCuisineRestaurants < ActiveRecord::Migration[5.1]
  def change
    remove_column :cuisine_restaurants, :star_rating, :string 
    remove_column :cuisine_restaurants, :price_rating, :string 
  end
end
