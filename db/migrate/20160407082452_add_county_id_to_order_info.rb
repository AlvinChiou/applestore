class AddCountyIdToOrderInfo < ActiveRecord::Migration
  def change
    add_column :order_infos, :billing_county_id, :integer
    add_column :order_infos, :shipping_county_id, :integer
  end
end
