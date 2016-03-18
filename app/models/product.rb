class Product < ActiveRecord::Base
  has_one :product_status
  has_one :category
  has_many :photos
  has_many :order_items
  belongs_to :product_status
  belongs_to :category
  accepts_nested_attributes_for :photos

  def update_quantity_after_checkout(checkout_item_number)
    self.quantity -= checkout_item_number
    self.save
  end

  def show_first_photo
    self.photos.first.image.medium.url
  end
end
