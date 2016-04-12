class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :add_to_cart, :add_to_wish_list]
  def index
    @products = Product.all.where(product_status_id: 3)
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
    render "carts/index"
    # redirect_to :back
  end

  def add_to_wish_list
    if !current_wish_list.wishes.include?(@product)
      ProductService.new(@product).add_to_wish_list!
      flash[:notice] = "你已成功將 #{@product.title} 加入願望清單！"
    else
      flash[:warning] = "你的願望清單已經有此商品了！"
    end
    redirect_to :back
  end

  def search_products
    @search, @products = Product.ransack(params[:q]), @search.result(distinct: true).to_a
    @products.each do |product|
      if product.product_status_id != 3
        @products.except(product)
      end
    end

    return @products.paginate(page: params[:page], per_page: 9)
  end

  private
  def find_product
    @product = Product.find(params[:id])
  end
end
