class AddUsernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :billing_name, :string, null: true
  end
end
