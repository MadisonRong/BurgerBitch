class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.integer :dish_id, null: false
      t.timestamps null: false
    end
  end
end
