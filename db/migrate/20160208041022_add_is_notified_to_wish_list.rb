class AddIsNotifiedToWishList < ActiveRecord::Migration
  def change
    add_column :wish_lists, :is_notified, :boolean, default: false
  end
end
