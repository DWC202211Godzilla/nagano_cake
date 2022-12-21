class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.page(params[:page])
  end

  def update
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all

    if params[:status]
      @order.update(order_params)
      redirect_to admin_order_path(@order)
    end

    if params[:making_status]
    end

  end


  private
  def order_params
    params.require(:order).permit(:status)
  end
end
