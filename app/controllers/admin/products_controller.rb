class Admin::ProductsController < AdminBaseController

  def index
    @products = Product.all.paginate(page: params[:page], per_page: 5)
  end

  def new
    @product = Product.new
    @photo = @product.photos.each do |p|
      p.build
    end
  end

  def edit
    @product = Product.find(params[:id])
    # 商品若沒照片，點擊編輯顯示不出檔案上傳的欄位
    if @product.photos.present?
      @photo = @product.photos
    else
      @photo = @product.photos.build
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      if @product.quantity > 0
        @product.update_columns(be_wished: 0)
      end
      redirect_to edit_admin_product_path(@product)
      flash[:notice] = "商品更新成功！"
    else
      render :edit
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
      flash[:notice] = "商品新增成功！"
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:title, :description, :quantity, :price, :can_be_wish,
                                    :original_quantity, :product_status_id, :category_id,
                                    photos_attributes: [:image, :id])
  end
end
