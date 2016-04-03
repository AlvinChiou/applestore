class AddQuantityLimitToProduct < ActiveRecord::Migration
  def change
    add_column :products, :quantity_limit, :boolean, default: true
  end
end
