class Admin::OrdersController < AdminBaseController
  before_action :find_order, only: [:show, :ship, :shipped, :cancel, :return]

  def index
    @orders = Order.order("id DESC").paginate(page: params[:page], per_page:10)
  end

  def show
    @order_info = @order.info
    @order_items = @order.items
  end

  def cancel
    @order.cancell_order!
    redirect_to :back
  end

  def ship
    @order.ship!
    redirect_to :back
  end

  def shipped
    @order.deliver!
    redirect_to :back
  end

  def return
    @order.return_good!
    redirect_to :back
  end
  
  private
  def find_order
    @order = Order.find(params[:id])
  end
end
