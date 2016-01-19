class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :add_to_cart]

  def index
    @products = Product.all
  end

  def show
  end

  def add_to_cart

    if !current_cart.items.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "你已成功將 #{@product.title} 加入購物車！"
    else
      flash[:warning] = "你的購物車已經有此商品了！"
    end
    redirect_to :back
  end


  def find_product
    @product = Product.find(params[:id])
  end

  def goto_checkout
    link_to("前往購物車結帳", carts_path)
  end

  def goto_shopping
    link_to("繼續選購", products_path)
  end
end
