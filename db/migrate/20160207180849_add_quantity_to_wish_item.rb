class AddQuantityToWishItem < ActiveRecord::Migration
  def change
    add_column :wish_items, :quantity, :integer
  end
end
