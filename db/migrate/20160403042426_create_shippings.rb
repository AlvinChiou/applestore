class CreateShippings < ActiveRecord::Migration
  def change
    create_table :shippings do |t|
      t.string :shipping_method
      t.integer :status
      t.integer :cost

      t.timestamps null: false
    end
  end
end
