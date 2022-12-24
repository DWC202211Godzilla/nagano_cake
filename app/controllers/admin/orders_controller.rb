class Admin::OrdersController < ApplicationController
before_action :authenticate_admin!
 def show
  @orders = Order.all
  @order = Order.find(params[:id])
  @order_details = @order.order_details.all
 end

 def update
  @order = Order.find(params[:id])
  @order.update(order_params)

  if @order.status == "paid_up"
   @order.order_details.each do |order_detail|
    order_detail.update(making_status: "production_pending")
   end
  end

  redirect_to request.referer
 end


 private
 def order_params
  params.require(:order).permit(:status)
 end
end