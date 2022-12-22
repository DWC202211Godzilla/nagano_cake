class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.where(params[:id]).order(created_at: :desc)
  end

  def update
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all

    if params[:status]
      @order.update(order_params)
      redirect_to request.referer
    end

    if params[:making]
      @order_details.update(making_status: params[:making_status])
      redirect_to request.referer
    end

  end


  private
  def order_params
    params.require(:order).permit(:status)
  end
end
