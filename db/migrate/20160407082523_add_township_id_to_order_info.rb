class AddTownshipIdToOrderInfo < ActiveRecord::Migration
  def change
    add_column :order_infos, :billing_township_id, :integer
    add_column :order_infos, :shipping_township_id, :integer
  end
end
