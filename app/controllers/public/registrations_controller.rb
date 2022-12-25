class Public::RegistrationsController < Devise::RegistrationsController


  def after_sign_up_path_for(resource_or_scope)
    customers_my_page_path(resource_or_scope)
  end

end
