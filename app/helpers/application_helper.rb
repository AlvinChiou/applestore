module ApplicationHelper

  def multiplied_by(first_integer, second_integer)
    first_integer * second_integer
  end

  def show_billing_name(user)
    ('f' == user.billing_name)?'':user.billing_name
  end

  def show_billing_address(user)
    ('f' == user.billing_address)?'':user.billing_address
  end

  def show_product_photo(product)
    if product.present?
      image_tag(product.photo.image.thumb.url)
    else
      image_tag("http://placehold.it/200x200&text=No Pic", class: "thumbnail")
    end
  end

  def render_cart_items_count(cart)
    cart.cart_items.count
  end

  def notice_message
    alert_types = {notice: :success, alert: :danger}

    close_button_options = {class: "close", "data-dismiss" => "alert", "aria-hidden" => true}
    close_button = content_tag(:button, "×", close_button_options)

    # goto_shopping = link_to("繼續購物", Rails.application.routes.url_helpers.products_path)

    alerts = flash.map do |type, message|

      if (/[product\/\d]/ =~ request.path && "/" != request.path)
        alert_content = close_button + message + "您可以" + goto_shopping + "或" + goto_checkout
      else
        alert_content = close_button + message
      end

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

    alerts.join("\n").html_safe
  end
end
