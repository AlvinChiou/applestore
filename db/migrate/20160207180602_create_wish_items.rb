class CreateWishItems < ActiveRecord::Migration
  def change
    create_table :wish_items do |t|

      t.timestamps null: false
    end
  end
end
