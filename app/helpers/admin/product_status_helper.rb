module Admin::ProductStatusHelper

  def show_enable_status(product_status)
    if product_status.enable == true
      "使用中"
    elsif product_status.enable == false
      "已停用"
    end
  end

  def show_modify_status_button(product_status)
    if product_status.enable == true
      link_to("停用", to_disable_admin_product_status_path(product_status), method: :post, class: "btn btn-danger")
    elsif product_status.enable == false
      link_to("啟用", to_enable_admin_product_status_path(product_status), method: :post,class: "btn btn-info")
    end
  end
end
