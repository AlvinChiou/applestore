class AddCanBeWishToProduct < ActiveRecord::Migration
  def change
    add_column :products, :can_be_wish, :boolean, default: false
  end
end
