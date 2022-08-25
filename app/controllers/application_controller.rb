class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    posts_path
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end

  def after_update_path_for(resource)
    profile_path(current_user.username)
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :website, :description, :image, :image_cache])
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email, :password, :website, :description])
  # end
end
