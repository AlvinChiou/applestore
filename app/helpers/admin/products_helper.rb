module Admin::ProductsHelper
  def can_be_wish?(product)
    if product.can_be_wish == true
      '是'
    else
      '否'
    end
  end
end
