class AddStatusToRestaurant < ActiveRecord::Migration
  def change
    add_column :restaurants, :status, :integer, default: 1
  end
end
