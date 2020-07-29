class ApplicationController < ActionController::Base
  before_action :authenticate_user! # Devise check if current user is sign_in or not (is he/she authenticated)
  before_action :configure_permitted_parameters, if: :devise_controller? 
	
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:role])
  end

end
