class Public::AddressesController < ApplicationController
  def index
    @addresses = Address.all
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:customer_id])
  end

  def create
    @address = Address.new(address_params)
    @address.save
    redirect_to addresses_path(params[:customer_id])
  end

  def update
    @address = Address.find(params[:customer_id])
    @address.update(address_params)
    redirect_to addresses_path(@address.id)
  end

  def destroy
    @address= Address.find(params[:customer_id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :post_code, :address)
  end
end
