class AddAddressToUser < ActiveRecord::Migration
  def change
    add_column :users, :billing_address, :string, null: true
  end
end
