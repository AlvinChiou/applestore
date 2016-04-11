class RemoveShippingAddressFromOrderInfo < ActiveRecord::Migration
  def change
    remove_column :order_infos, :shipping_address
  end
end
