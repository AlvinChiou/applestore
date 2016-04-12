class CartsController < UserBaseController
  # before_action :authenticate_user!

  def checkout
    @order = current_user.orders.build
    @info = @order.build_info
  end

  def clean
    current_cart.clean!
    flash[:warning] = "已清空購物車所有選購項目"
    redirect_to carts_path
  end
end
