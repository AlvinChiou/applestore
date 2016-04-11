class AddTownshipIdToUser < ActiveRecord::Migration
  def change
    remove_column :users, :township_id
    add_column :users, :billing_township_id, :integer, default: 0
  end
end
