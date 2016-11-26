class CustomDevise::RegistrationsController < Devise::RegistrationsController
  private
  def sign_up_params
    super
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :color)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :color)
  end
end
