class CreateShipmentPolicies < ActiveRecord::Migration
  def change
    create_table :shipment_policies do |t|
      t.string :name
      t.integer :free_shipment_price
      t.integer :free_shipment_amount

      t.timestamps null: false
    end
  end
end
