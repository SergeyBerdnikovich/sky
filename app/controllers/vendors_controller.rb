class VendorsController < ApplicationController
  before_filter :check_user

  def index
  	@vendor = current_user.vendor
  end

  def check_user
    redirect_to root_path unless current_user
  end

end