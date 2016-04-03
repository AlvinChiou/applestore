module OrdersHelper

  def show_order_created_datetime(order)
    order.created_at.strftime('%Y-%m-%d %I:%M:%S')
  end
  
  def render_order_state(order)
    t("orders.order_state.#{order.aasm_state}")
  end

  def render_order_is_cancelled(order)
    if "order_cancelled" == order.aasm_state
      true
    else
      false
    end
  end

  def render_order_paid_state(order)
    if order.is_paid?
      "已付款"
    else
      "未付款"
    end
  end
end
