class UserDashboardController < ApplicationController
  def dashboard
    redirect_to root_path unless current_user

    @properties = current_user.properties
  end
end
