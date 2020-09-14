class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastname, :firstname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:lastname, :firstname, :email, :avatar, :password, :password_confirmation])
  end
end
