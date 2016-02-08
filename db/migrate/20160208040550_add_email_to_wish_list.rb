class AddEmailToWishList < ActiveRecord::Migration
  def change
    add_column :wish_lists, :email, :string
  end
end
