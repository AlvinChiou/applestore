class Product < ActiveRecord::Base
  has_many :photos
  has_one :product_status
  has_many :order_items
  belongs_to :product_status
  accepts_nested_attributes_for :photos

  def update_quantity_after_checkout(checkout_item_number)
    self.quantity -= checkout_item_number
    self.save
  end

  def show_first_photo
    self.photos.first.image.medium.url
  end
end
