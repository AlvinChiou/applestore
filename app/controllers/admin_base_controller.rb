class AdminBaseController < ApplicationController
  layout "admin"
  before_filter :store_location
  before_action :authenticate_user!
  before_action :admin_required
end