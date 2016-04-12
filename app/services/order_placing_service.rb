class OrderPlacingService
  def initialize(cart, order, order_params)
    @order = order
    @cart = cart
    @order_params = order_params
  end

  def deduct_stock!
    # 扣庫存
    @order_items = @order.items
    @order_items.each do |item|
      @product = Product.find(item.product_id)
      @product.update_quantity_after_checkout(item.quantity)
    end
  end
end