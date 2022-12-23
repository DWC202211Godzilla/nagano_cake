class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
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
    customer=Customer.find(params[:format])
    customer.update(is_deleted: true)
    customer.save
    reset_session
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:family_name, :personal_name, :family_name_kana, :personal_name_kana, :email, :post_code, :address, :phone_number)
  end


end
