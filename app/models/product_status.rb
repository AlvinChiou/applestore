class ProductStatus < ActiveRecord::Base
  belongs_to :product
  has_many :products
  def to_enable
    self.update_columns(enable: true)
  end

  def to_disable
    self.update_columns(enable: false)
  end
end
