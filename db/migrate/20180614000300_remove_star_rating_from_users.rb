class RemoveStarRatingFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :star_rating, :string 
    remove_column :users, :price_rating, :string 
  end
end
