class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @customers=Customer.page(params[:page])
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    customer=Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to admin_customer_path(customer.id)
    else
      render edit_admin_customer_path(customer.id)
    end
  end



  private

  def customer_params
    params.require(:customer).permit(:family_name, :personal_name, :family_name_kana, :personal_name_kana, :email, :post_code, :address, :phone_number, :is_deleted)
  end


end
