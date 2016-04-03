class AddOrignalPriceToProduct < ActiveRecord::Migration
  def change
    add_column :products, :original_price, :integer, default: 0
  end
end
