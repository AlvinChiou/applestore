class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :pay2go_cc_notify
  before_action :find_order_by_token, only: [:show, :pay_with_credit_card, :pay2go_cc_notify]
  protect_from_forgery except: :pay2go_cc_notify

  def show
    @order_info = @order.info
    @order_items = @order.items
  end

  def create
    @order = current_user.orders.build(order_params)
    if @order.save
      @order.build_item_cache_from_cart(current_cart)
      @order.calculate_total!(current_cart)
      current_cart.clean!
      OrderMailer.notify_order_placed(@order).deliver_now!

      billing_name = order_params[:info_attributes][:billing_name]
      billing_address = order_params[:info_attributes][:billing_address]
      update_current_user_data(billing_name, billing_address)

      redirect_to order_path(@order.token)
    else
      render "carts/checkout"
    end
  end

  def pay_with_credit_card
    @order.set_payment_with!("credit_card")

    # 結帳
    @order.make_payment!

    # 結帳後扣庫存
    @order_items = @order.items
    @order_items.each do |item|
      @product = Product.find(item.product_id)
      @product.update_quantity_after_checkout(item.quantity)
    end

    redirect_to account_orders_path, notice: "成功完成付款"
  end

  def pay2go_cc_notify
    if params["Status"] == "SUCCESS"

      @order.make_payment!

      if @order.is_paid?
        flash[:notice] = "信用卡付款成功"
        redirect_to account_orders_path
      else
        render text: "信用卡失敗"
      end
    else
      render text: "交易失敗"
    end
  end

  private
  def order_params
    params.require(:order).permit(info_attributes: [:billing_name,
                                                    :billing_address,
                                                    :shipping_name,
                                                    :shipping_address])
  end
  
  private
  def find_order_by_token
    @order = Order.find_by_token(params[:id])
  end
end
