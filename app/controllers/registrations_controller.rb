class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :website, :description)
  end

  def account_update_params
    params.require(:user).permit(:username, :first_name, :last_name, :website, :description, :image, :image_cache, :email, :password, :password_confirmation, :current_password)
  end
end
