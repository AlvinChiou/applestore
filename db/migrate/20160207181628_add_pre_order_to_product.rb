class AddPreOrderToProduct < ActiveRecord::Migration
  def change
    add_column :products, :pre_order, :integer, default: 0
  end
end
