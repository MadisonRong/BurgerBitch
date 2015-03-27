class CreateDishTypes < ActiveRecord::Migration
  def change
    create_table :dish_types do |t|
      t.string :name, null: false
      t.timestamps null: false
    end
  end
end
