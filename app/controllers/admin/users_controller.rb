class Admin::UsersController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def index
    @users = User.all.paginate(page: params[:page], per_page:10)
  end

  def to_admin
    @user = User.find(params[:id])
    @user.to_admin

    redirect_to admin_users_path
  end

  def to_normal
    @users = User.where(is_admin: true)
    @user = User.find(params[:id])
    if @users.length > 1
      @user.to_normal
      redirect_to admin_users_path
    else
    # 警告：不可以沒有管理員
      redirect_to admin_users_path, alert: "沒有貴族誰來管網站啦？！"
    end
  end
end
