class UserBaseController < ApplicationController
  before_filter :store_location
  before_action :authenticate_user!
end