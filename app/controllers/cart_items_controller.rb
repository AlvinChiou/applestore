class CartItemsController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @cart = current_cart
    @item = @cart.cart_items.find_by(product_id: params[:id])
    @product = @item.product
    @item.destroy

    flash[:notice] = "已將 #{@product.title} 重購物車移除！"
    redirect_to :back
  end

  def update
    @cart = current_cart
    @item = @cart.find_cart_item(params[:id])
    @product = @item.product

    if @item.product.quantity >= item_params[:quantity].to_i
      @item.update(item_params)
      flash[:notice] = "已更新 #{@product.title} 數量！"
    else
      flash[:warning] = " #{@product.title} 數量不足以加入購物車"
    end
    redirect_to carts_path
  end

  private
  def item_params
    params.require(:cart_item).permit(:quantity)
  end
end
