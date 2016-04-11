class RemoveShippingNameFromOrderInfo < ActiveRecord::Migration
  def change
    remove_column :order_infos, :shipping_name
  end
end
