class AddWishListIdToWishItem < ActiveRecord::Migration
  def change
    add_column :wish_items, :wish_list_id, :integer
  end
end
