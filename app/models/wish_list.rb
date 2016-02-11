class WishList < ActiveRecord::Base
  has_many :wish_items, dependent: :destroy
  has_many :wishes, through: :wish_items, source: :product

  def find_wish_list_item(product)
    wish_items.find_by(product_id: product)
  end

  def add_product_to_wish_list(product)
    wishes << product
  end

  def clean!
    wish_items.destroy_all
  end

end