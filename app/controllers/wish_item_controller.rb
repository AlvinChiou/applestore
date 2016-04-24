class WishItemController < ApplicationController
  before_action :authenticate_user!

  def destroy
    WishItemService.new(current_wish_list).destroy!
    flash[:warning] = "已將 #{@product.title} 從願望清單移除！"
    redirect_to :back
  end

  def update
    @wish_list = current_wish_list
    @wish_list_item = @wish_list.find_wish_list_item(params[:id])
    @product = @wish_list_item.product

    @wish_list_item.update(wishes_params)
    update_product_be_wished_count(@product)

    flash[:notice] = "已更新 #{@product.title} 許願清單數量！"
    redirect_to wish_list_index_path
  end

  private
  def wishes_params
    params.require(:wish_item).permit(:quantity)
  end
end
