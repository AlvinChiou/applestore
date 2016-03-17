class AddEnableToProductStatus < ActiveRecord::Migration
  def change
    add_column :product_statuses, :enable, :boolean, default: true
  end
end
