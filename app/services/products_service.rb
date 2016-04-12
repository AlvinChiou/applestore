class ProductService
  def initialize(product)
    @product = product
  end

  def add_to_wish_list!
    add_product_be_wished_count(@product, 1)
    current_wish_list.add_product_to_wish_list(@product)
  end
end