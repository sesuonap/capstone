class CreatePizzas < ActiveRecord::Migration[5.1]
  def change
    create_table :pizzas do |t|
      t.string :order_confirmation

      t.timestamps
    end
  end
end
