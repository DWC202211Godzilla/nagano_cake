class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.page(params[:page]).order(created_at: :desc)
  end

  def update
    @order = Order.find(params[:id])
  end


  private
  def order_params
    params.require(:order).permit(:status)
  end
end
