class RemoveShippingCountyIdFromOrderInfo < ActiveRecord::Migration
  def change
    remove_column :order_infos, :shipping_county_id
  end
end
