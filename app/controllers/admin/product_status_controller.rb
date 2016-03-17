class Admin::ProductStatusController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required
  before_action :find_status, only: [:update, :edit, :to_enable, :to_disable]

  def index
    @product_statuses = ProductStatus.all.paginate(page: params[:page], per_page:5)
  end

  def new
    @product_status = ProductStatus.new
  end

  def edit
  end

  def create
    @product_status = ProductStatus.new(product_status_params)
    if @product_status.save
      redirect_to admin_product_status_index_path
      flash[:notice] = "新增商品狀態成功！"
    else
      render :new
    end
  end

  def update
    if @product_status.update(product_status_params)
      redirect_to admin_product_status_index_path, notice: "商品狀態更新成功！"
    else
      render :edit
    end
  end

  def to_enable
    @product_status.to_enable
    redirect_to admin_product_status_index_path, notice: "商品狀態：「#{@product_status.name}」已啟用！"
  end

  def to_disable
    @product_status.to_disable
    redirect_to admin_product_status_index_path, notice: "商品狀態：「#{@product_status.name}」已停用！"
  end
  
  private
  def product_status_params
    params.require(:product_status).permit(:name)
  end

  private
  def find_status
    @product_status = ProductStatus.find(params[:id])
  end
  
end
