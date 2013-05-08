class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    if params[:user][:redirect] == 'residential'
      profiles_wizard1_path
    else
      static_pages_myaccount_path
    end
  end
end