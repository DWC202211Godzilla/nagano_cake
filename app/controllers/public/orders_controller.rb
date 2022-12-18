class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all

    if params[:order][:payment_method] == "credit_card"
      @order.payment_method = 0
    else
      @order.payment_method = 1
    end

    if params[:order][:address_number] == "1"
      @order.name = current_customer.family_name + current_customer.personal_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.post_code
    elsif params[:order][:address_number] == "2"
      if Address.exists?(name: params[:order][:registered])
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
        @order.postal_code = Address.find(params[:order][:registered]).post_code
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      if address_new.save
      else
        render :new
      end
    else
      render :new
    end
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:name,:address,:postal_code)
  end

  def address_params
    params.require(:order).permit(:name,:address,:post_code)
  end
end
