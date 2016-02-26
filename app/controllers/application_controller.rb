class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  before_action :store_location

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited.
    return unless request.get?
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end


  def after_sign_in_path_for(resource)

    @user = current_user
    if @user.saver
      account_path
    else
      session[:previous_url] || root_path
    end
  end



  protected

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:last_name, :email, :password, :password_confirmation, :phone) }
  devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :last_name, :email, :password, :phone) }
  devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:last_name, :email, :password, :password_confirmation, :current_password, :phone) }
end


  #may have to precise that for the user != saver the redirection/
  # is not home page wich is the default page
  end

