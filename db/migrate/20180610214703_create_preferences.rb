class CreatePreferences < ActiveRecord::Migration[5.1]
  def change
    create_table :preferences do |t|
      t.integer :user_id
      t.integer :cuisine_id

      t.timestamps
    end
  end
end
