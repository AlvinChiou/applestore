module CartsHelper
  def render_cart_total_price(cart)
    cart.total_price
  end

  def render_cart_total_price_without_shipment(cart)
    cart.count_total_price_without_shipment
  end

  def render_shipment(cart)
    render_cart_total_price(cart) - render_cart_total_price_without_shipment(cart)
  end

  def render_select_quantity(product)

    # 寫法一：
    # (product.quantity_limit == true ? (product.quantity <= 10 ? 1..product.quantity : 1..10) : 1..10)
    # 寫法二：
    1..product.quantity if product.quantity <= 10 and product.quantity_limit == false
  else
    1..10

  end
end
