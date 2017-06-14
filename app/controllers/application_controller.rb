class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  # method used to validate user credentials
  	def configure_permitted_parameters
  		devise_parameter_sanitizer.permit(:sign_up, keys:[:first_name, :last_name, :user_type, :email, :password, :password_confirmation, :remember_me])
  		devise_parameter_sanitizer.permit(:sign_in, keys:[:email, :password, :password_confirmation, :remember_me])
  		devise_parameter_sanitizer.permit(:account_update, keys:[:first_name, :last_name, :email, :password, :password_confirmation, :remember_me])
  	end  

end
