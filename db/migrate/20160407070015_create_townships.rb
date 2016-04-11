class CreateTownships < ActiveRecord::Migration
  def change
    create_table :townships do |t|
      t.belongs_to :county, index: true, foreign_key: true
      t.string :name
      t.string :zip_code
    end
  end
end
