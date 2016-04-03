class AddShipmentToProduct < ActiveRecord::Migration
  def change
    add_column :products, :shipment, :integer, default: 100
  end
end
