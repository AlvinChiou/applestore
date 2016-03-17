class AddStatusToProduct < ActiveRecord::Migration
  def change
    add_column :products, :product_status_id, :integer, default: 0
  end
end
