class AddCountyIdToUser < ActiveRecord::Migration
  def change
    remove_column :users, :county_id
    add_column :users, :billing_county_id, :integer, default: 0
  end
end
