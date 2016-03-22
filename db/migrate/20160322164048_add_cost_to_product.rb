class AddCostToProduct < ActiveRecord::Migration
  def change
    add_column :products, :cost, :integer, default: 0
  end
end
