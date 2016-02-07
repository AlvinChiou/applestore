class AddProductIdToWishItem < ActiveRecord::Migration
  def change
    add_column :wish_items, :product_id, :integer
  end
end
