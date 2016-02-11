class AddUserIdToWishList < ActiveRecord::Migration
  def change
    add_column :wish_lists, :user_id, :integer
  end
end
