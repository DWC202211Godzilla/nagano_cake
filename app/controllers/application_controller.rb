class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :personal_name, :family_name_kana, :personal_name_kana, :email, :password, :password_confirmation, :post_code, :address, :phone_number, :is_deleted])
  end

end
