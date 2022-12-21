class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception
  before_action :configre_permitted_parameters, if: :devise_controller?

  def configre_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:family_name, :personal_name, :family_name_kana, :personal_name_kana, :email, :password, :password_confirmation, :post_code, :address, :phone_number, :is_deleted])
  end

  private

  def after_sign_up_path_for(resource_or_scope)
    customers_my_page_path(resource_or_scope)
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
        admin_path
    else
        root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        root_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
  end

end
