class CreateDishTypes < ActiveRecord::Migration
  def change
    create_table :dish_types do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
    add_index :dish_types, :name, unique: true
  end
end
