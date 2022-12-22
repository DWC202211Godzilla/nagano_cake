class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])

    @order.update(order_params)
    redirect_to request.referer
  end


  private
  def order_params
    params.require(:order).permit(:status)
  end
end
