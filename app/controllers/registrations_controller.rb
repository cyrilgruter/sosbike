
class RegistrationsController < Devise::RegistrationsController
  protected

  def configure_permitted_parameters
   devise_parameter_sanitizer.for(:sign_up) << :phone
   devise_parameter_sanitizer.for(:sign_up) << :first_name
  end

end
