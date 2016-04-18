module ProductsHelper

  def show_original_price(product)
    number_with_delimiter(product.original_price, raise: true)+" NTD"
  end

  def show_price(product)
    number_with_delimiter(product.price, raise: true)+" NTD"
  end

  def show_discount(product)
    number_with_delimiter(product.original_price - product.price, raise: true)+" NTD"
  end

  def show_shipment(product)
    number_with_delimiter(product.shipment)+" NTD"
  end

  def show_product_quantity(product)
    if product.quantity_limit == true
      "剩餘：#{product.quantity}"
    end
  end

  def show_original_quantity_at_index(product)
    if product.original_quantity > product.quantity && product.original_quantity > 0 && product.quantity_limit == true
      "總數量：#{product.original_quantity}，已售出：#{product.original_quantity - product.quantity}"
    end
  end

  def button_status_by_product(product)
    # def button_status_by_product(product, options={})

    if product.quantity > 0
      case
        when current_page?(root_path) || current_page?('/products')
          link_to(" 立馬搶購", add_to_cart_product_path(product), method: :post, :class => "fa fa-shopping-cart fa-lg btn btn-danger")
        else
          link_to(" 立馬搶購", add_to_cart_product_path(product), method: :post, :class => "fa fa-shopping-cart fa-2x btn btn-primary btn-lg btn-danger btn-block")
      end

    elsif product.quantity <= 0 && product.can_be_wish && product.quantity_limit
      case
        when current_page?('/products')
          link_to("上架通知我", add_to_wish_list_product_path(product), method: :post, :class => "glyphicon glyphicon-info-sign btn btn-warning")
        else
          link_to("上架通知我", add_to_wish_list_product_path(product), method: :post, :class => "glyphicon glyphicon-info-sign btn btn-primary btn-lg btn-warning btn-block")
      end

    elsif product.quantity <= 0 && product.can_be_wish == false && product.quantity_limit == true

      case
        when current_page?('/products')
          link_to("已銷售一空", products_path, :class => "btn btn-default disabled")
        else
          link_to("已銷售一空", products_path, :class => "btn btn-default btn-lg disabled btn-block")
      end
    end
  end

  def goto_checkout
    link_to("前往購物車結帳", carts_path)
  end

  def goto_shopping
    link_to("繼續選購", products_path)
  end
end
