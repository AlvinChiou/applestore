class Admin::CategoriesController < AdminBaseController
  before_action :find_category, only: [:update, :edit, :to_enable, :to_disable]

  def show
    @category = Category.find(params[:id])
  end

  def index
    @categories = Category.all.paginate(page: params[:page], per_page:10)
  end

  def new
    @category = Category.new
  end

  def edit

  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to admin_categories_path
      flash[:notice] = "新增商品分類成功！"
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
      flash[:notice] = "商品分類更新成功！"
    else
      render :edit
    end
  end

  def to_enable
    @category.to_enable
    redirect_to admin_categories_path, notice: "商品分類：「#{@category.name}」已啟用！"
  end

  def to_disable
    @category.to_disable
    redirect_to admin_categories_path, notice: "商品分類：「#{@category.name}」已停用！"
  end
  
  private
  def category_params
    params.require(:category).permit(:name)
  end
  
  private
  def find_category
    @category = Category.find(params[:id])
  end
end
