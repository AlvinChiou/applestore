module ProductsHelper
  def button_status_by_product(product)
    if product.quantity > 0
      if request.path == "/products"
        link_to("加入購物車", add_to_cart_product_path(product), method: :post, :class => "glyphicon glyphicon-plus btn btn-danger")
      else
        link_to("加入購物車", add_to_cart_product_path(product), method: :post, :class => "glyphicon glyphicon-plus btn btn-primary btn-lg btn-danger")
      end
    elsif product.quantity <= 0 && product.can_be_wish == true
      if request.path == "/products"
        link_to("上架通知我", add_to_wish_list_product_path(product), method: :post, :class => "glyphicon glyphicon-info-sign btn btn-warning")
      else
        link_to("上架通知我", add_to_wish_list_product_path(product), method: :post, :class => "glyphicon glyphicon-info-sign btn btn-primary btn-lg btn-warning")
      end

    elsif product.quantity <= 0 && product.can_be_wish == false
      if request.path == "/products"
        link_to("已銷售一空", products_path , :class => "btn btn-default disabled")
      else
        link_to("已銷售一空", products_path, :class => "btn btn-default btn-lg disabled")
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
