class AddOrigianlQuantityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :original_quantity, :integer, default: 0
  end
end
