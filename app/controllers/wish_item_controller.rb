class WishItemController < ApplicationController
  before_action :authenticate_user!

  def destroy
    @wish_list = current_wish_list
    @wish_list_item = @wish_list.find_wish_list_item(params[:id])
    @product = @wish_list_item.product
    @wish_list_item.destroy

    flash[:warning] = "已將 #{@product.title} 從願望清單移除！"
    redirect_to :back
  end

  def update

  end
  
  private
  def wishes_params
    
  end
end
