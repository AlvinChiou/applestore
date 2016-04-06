class OrderPlacingService
  def initialize(cart, order, order_params)
    @order = order
    @cart = cart
    @order_params = order_params
  end

  def place_order!
    @order.build_item_cache_from_cart(@cart)
    @order.calculate_total!(@cart)
    @cart.clean!
    OrderMailer.notify_order_placed(@order).deliver_now!

    billing_name = order_params[:info_attributes][:billing_name]
    billing_address = order_params[:info_attributes][:billing_address]
    update_current_user_data(billing_name, billing_address)
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