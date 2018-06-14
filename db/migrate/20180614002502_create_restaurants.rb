class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.integer :star_rating
      t.integer :price_rating
      t.string :address
      t.string :city
      t.string :zip
      t.string :phone_number

      t.timestamps
    end
  end
end
