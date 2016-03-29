class AddIntroductionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :introduction, :text, :null => true
  end
end
