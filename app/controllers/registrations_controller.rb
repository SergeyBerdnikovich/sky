class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    profiles_wizard1_path(:id => current_user.properties.first.profile.id)
  end
end