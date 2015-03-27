class AddDeviseToAdmins < ActiveRecord::Migration
  def self.up
    change_table(:admins) do |t|
      ***REMOVED******REMOVED*** Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ***REMOVED******REMOVED*** Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ***REMOVED******REMOVED*** Rememberable
      t.datetime :remember_created_at

      ***REMOVED******REMOVED*** Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ***REMOVED******REMOVED*** Confirmable
      ***REMOVED*** t.string   :confirmation_token
      ***REMOVED*** t.datetime :confirmed_at
      ***REMOVED*** t.datetime :confirmation_sent_at
      ***REMOVED*** t.string   :unconfirmed_email ***REMOVED*** Only if using reconfirmable

      ***REMOVED******REMOVED*** Lockable
      ***REMOVED*** t.integer  :failed_attempts, default: 0, null: false ***REMOVED*** Only if lock strategy is :failed_attempts
      ***REMOVED*** t.string   :unlock_token ***REMOVED*** Only if unlock strategy is :email or :both
      ***REMOVED*** t.datetime :locked_at


      ***REMOVED*** Uncomment below if timestamps were not included in your original model.
      ***REMOVED*** t.timestamps
    end

    add_index :admins, :email,                unique: true
    add_index :admins, :reset_password_token, unique: true
    ***REMOVED*** add_index :admins, :confirmation_token,   unique: true
    ***REMOVED*** add_index :admins, :unlock_token,         unique: true
  end

  def self.down
    ***REMOVED*** By default, we don't want to make any assumption about how to roll back a migration when your
    ***REMOVED*** model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
