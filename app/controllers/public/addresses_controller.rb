class Public::AddressesController < ApplicationController
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
    redirect_to addresses_path(@address.id)
    else
    render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path(@address.id)
  end

  def destroy
    @address = Address.find(params[:customer_id])
    @address.destroy
    redirect_to addresses_path
  end

  private
  def address_params
    params.require(:address).permit(:name, :post_code, :address)
  end
end
