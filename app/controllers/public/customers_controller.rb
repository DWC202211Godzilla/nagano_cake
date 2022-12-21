class Public::CustomersController < ApplicationController
  def show
  end

  def edit
  end

  def update
    customer=Customer.find(current_customer.id)
    if customer.update(customer_params)
      redirect_to customers_my_page_path
    else
      render customers_information_edit_path(customer.id)
    end 
  end

  def unsubscribe
  end

  def withdrawal
    current_customer.is_deleted=true
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :personal_name, :family_name_kana, :personal_name_kana, :email, :post_code, :address, :phone_number)
  end
 

end
