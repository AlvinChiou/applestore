class RemoveShippingTownshipIdFromOrderInfo < ActiveRecord::Migration
  def change
    remove_column :order_infos, :shipping_township_id
  end
end
