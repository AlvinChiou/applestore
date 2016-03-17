module Admin::CategoriesHelper
  def show_category_enable_status(category)
    if category.status == true
      "使用中"
    elsif category.status == false
      "已停用"
    end
  end

  def show_modify_category_status_button(category)
    if category.status == true
      link_to("停用", to_disable_admin_category_path(category), method: :post, class: "btn btn-danger btn-sm")
    elsif category.status == false
      link_to("啟用", to_enable_admin_category_path(category), method: :post,class: "btn btn-primary btn-sm")
    end
  end
end
