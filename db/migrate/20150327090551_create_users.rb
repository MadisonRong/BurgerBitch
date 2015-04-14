class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nickname, null: false
      t.string :email, null:false
      t.string :avatar_url
      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
