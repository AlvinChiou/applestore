class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart
  helper_method :current_wish_list

  def admin_required
    if !current_user.admin?
      redirect_to "/"
    end
  end

  def update_current_user_data(billing_name, billing_address)
    user = User.find_by(id: current_user.id)
    user.update_columns(billing_name: billing_name, billing_address: billing_address)
  end

  def add_product_be_wished_count(product, add_wished_count)
    product = Product.find(product.id)
    wished_count = product.be_wished + add_wished_count.to_i
    product.update_columns(be_wished: wished_count)
  end

  def subtract_product_be_wished_count(product, subtract_wished_count)
    product = Product.find(product.id)
    wished_count = product.be_wished - subtract_wished_count.to_i
    product.update_columns(be_wished: wished_count)
  end

  def current_cart
    @current_cart ||= find_cart
  end

  def current_wish_list
    @current_wish_list ||= find_wish_list
  end

  private
  def find_cart
    cart = Cart.find_by(id: session[:cart_id])
    unless cart.present?
      cart = Cart.create
    end

    session[:cart_id] = cart.id
    cart
  end

  private
  def find_wish_list
    if current_user.present?
      wish_list = WishList.find_by_user_id(current_user.id)

      unless wish_list.present?
        wish_list = WishList.create(email: current_user.email, user_id: current_user.id)
      end

      wish_list
    end
  end
end
