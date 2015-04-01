class CreateDishes < ActiveRecord::Migration
  def change
    create_table :dishes do |t|
      t.integer :dish_type_id, null: false
      t.integer :restaurant_id, null: false
      t.string :name, null: false
      t.float :price, null: false
      t.timestamps null: false
    end
  end
end
