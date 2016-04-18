class AddExpiresToProduct < ActiveRecord::Migration
  def change
    add_column :products, :expires, :datetime, null: true
  end
end
