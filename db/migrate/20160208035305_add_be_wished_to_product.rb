class AddBeWishedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :be_wished, :integer, default: 0
  end
end
