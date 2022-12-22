class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @addresses = Address.all
    @address.customer_id = current_customer.id
    if @address.save!
    redirect_to addresses_path
    else
    render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :post_code, :address)
  end
end
