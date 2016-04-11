class WishItemService
  def initialize(wish_list)
    @wish_list = wish_list
  end

  def destroy!
    @wish_list_item = @wish_list.find_wish_list_item(params[:id])
    @product = @wish_list_item.product
    @wish_list_item.destroy
    update_product_be_wished_count(@product)
  end
end