class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :username, :introduction, :icon, :wallpaper])
  end

end
