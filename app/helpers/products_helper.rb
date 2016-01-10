module ProductsHelper
  def button_status_by_product(product)
    if product.quantity > 0
      if request.path == "/products"
        link_to("加入購物車", add_to_cart_product_path(product), method: :post, :class => "glyphicon glyphicon-plus btn btn-danger")
      else
        link_to("加入購物車", add_to_cart_product_path(product), method: :post, :class => "glyphicon glyphicon-plus btn btn-primary btn-lg btn-danger")
      end
    else
      if request.path == "/products"
        link_to("上架通知我", "#", :class => "glyphicon glyphicon-info-sign btn btn-warning")
      else
        link_to("上架通知我", "#", :class => "glyphicon glyphicon-info-sign btn btn-primary btn-lg btn-warning")
      end
    end
  end
end
