class AddQuantityToWishItem < ActiveRecord::Migration
  def change
    add_column :wish_items, :quantity, :integer, default: 1
  end
end
