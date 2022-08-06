class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #called before every method in this controller
  before_action :configure_permitted_parameters, if: :devise_controller?

  #adding custom devise fields
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])

    devise_parameter_sanitizer.permit(:sign_up, keys: [:usertype])
    devise_parameter_sanitizer.permit(:account_update, keys: [:usertype])
  end
end
