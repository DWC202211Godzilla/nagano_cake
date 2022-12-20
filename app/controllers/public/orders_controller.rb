class Public::OrdersController < ApplicationController
  before_action :confirm_match? , only: [:show]

  def new
    @order = Order.new
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total = @cart_items.inject(0) {|sum , item| sum += (item.price * 1.1 )}

    @order = Order.new(order_params)
    @order.shipping_cost = 800
    @order.total_payment = @order.shipping_cost + @total
    @order.status = "waiting"

    if params[:order][:address_number] == "1"
      @order.name = current_customer.family_name + current_customer.personal_name
      @order.address = current_customer.address
      @order.postal_code = current_customer.post_code
    elsif params[:order][:address_number] == "2"
      if Address.all.count != 0
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
        @order.postal_code = Address.find(params[:order][:registered]).post_code
      else
        render :new
      end
    elsif params[:order][:address_number] == "3"
      address_new = current_customer.addresses.new(address_params)
      address_new.post_code = @order.postal_code
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
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)

    if @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.item_id = cart.item_id
        order_detail.order_id = @order.id
        order_detail.price = cart.item.price * 1.1
        order_detail.amount = cart.amount
        order_detail.save
      end
      redirect_to orders_complete_path
      cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end

  def index
    @orders = Order.all.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:payment_method,:name,:address,:postal_code,:shipping_cost,:total_payment,:status)
  end

  def address_params
    params.require(:order).permit(:name,:address)
  end

  def confirm_match?
    if params[:id] == "confirm"
      redirect_to new_order_path
    end
  end
end
