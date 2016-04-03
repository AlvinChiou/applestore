class AddFreeShippingToProduct < ActiveRecord::Migration
  def change
    add_column :products, :free_shipping_quantity, :integer, default: 2
  end
end
