module ApplicationHelper
  def multiplied_by(first_integer, second_integer)
    first_integer * second_integer
  end

  def show_billing_name(user)
    user.billing_name unless user.billing_name.nil? || user.billing_name.blank?
  end

  def show_billing_address(user)
    user.billing_address unless user.billing_address.nil? || user.billing_address.blank?
  end

  def show_county(user)
    user.billing_county_id unless user.billing_county_id == 0
  end

  def show_township(user)
    user.billing_township_id unless user.billing_township_id == 0
  end

  def show_product_photo(product)
    if product.photos.present?
      image_tag(product.photos.first.image.thumb.url)
    else
      image_tag("http://placehold.it/200x200&text=No Pic", class: "thumbnail")
    end
  end

  def render_cart_items_count(cart)
    cart.cart_items.count
  end

  def render_wish_items_count(wish_list)
    wish_list.wishes.count if wish_list.present?
  else
    0
  end

  def render_banner
    render "common/banner" if current_page?(root_path) || current_page?('/products')
  end

  def show_user_name_or_email
    current_user.name unless current_user.name.nil? && current_user.name.blank?
  else
    current_user.email
  end

  private
  def generate_alert_content
    # 未完成
    if current_page?(action: 'add_to_cart')
      "您可以" + goto_shopping + "或" + goto_checkout
    else
      ''
    end
  end

  def notice_message
    alert_types = {notice: :success, alert: :danger}

    close_button_options = {class: "close", "data-dismiss" => "alert", "aria-hidden" => true}
    close_button = content_tag(:button, "×", close_button_options)

    # goto_shopping = link_to("繼續購物", Rails.application.routes.url_helpers.products_path)

    alerts = flash.map do |type, message|
      alert_content = close_button + message

      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"

      content_tag(:div, alert_content, class: alert_class)
    end

    alerts.join("\n").html_safe
  end

  # ref: http://stackoverflow.com/questions/4081744/devise-form-within-a-different-controller
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
