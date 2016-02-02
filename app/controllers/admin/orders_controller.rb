class Admin::OrdersController < ApplicationController
  layout "admin"

  before_action :authenticate_user!
  before_action :admin_required
  before_action :find_order_by_token, only: [:show, :ship, :shipped, :cancel, :return]

  def index
    @orders = Order.order("id DESC")
  end

  def show
    @order_info = @order.info
    @order_items = @order.items
  end

  def cancel
    
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
  def find_order_by_token
    @order = Order.find_by_token(params[:id])
  end
end
