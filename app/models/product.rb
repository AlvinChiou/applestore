class Product < ActiveRecord::Base
  has_one :photo
  has_many :order_items
  accepts_nested_attributes_for :photo

  def update_quantity_after_checkout(checkout_item_number)
    self.quantity -= checkout_item_number
    self.save
  end
end
