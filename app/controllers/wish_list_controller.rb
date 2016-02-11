class WishListController < ApplicationController
  before_action :authenticate_user!

  def transfer_to_cart
    current_wish_list.wishes.each do |product|
      if !current_cart.items.include?(product) && product.quantity > 0
        current_cart.add_product_to_cart(product)
        current_wish_list.delete_product_from_wish_list(product)
      end
    end
    flash[:notice] = "已將願望清單中有庫存之商品加入購物車！"
    redirect_to :back
  end

  def clean

  end

end
