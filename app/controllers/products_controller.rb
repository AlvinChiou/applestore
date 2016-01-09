class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :add_to_cart]

  def index
    @products = Product.all
  end

  def show
  end

  def add_to_cart
    current_cart.add_product_to_cart(@product)
    redirect_to :back
  end


  def find_product
    @product = Product.find(params[:id])
  end
end
