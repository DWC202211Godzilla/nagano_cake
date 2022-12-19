class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.page(params[:page])
  end

  def update
    @orders = Order.all
    @order = Order.find(params[:id])
    
  end


  private
  def order_params
    params.require(:order).permit(:status)
  end
end
