class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)

    @user = current_user
    if @user.saver
      account_path
    end
  end

  #may have to precise that for the user != saver the redirection/
  # is not home page wich is the default page
end
