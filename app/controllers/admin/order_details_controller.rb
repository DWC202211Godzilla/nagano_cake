class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = Order.find(@order_detail.order_id)
    @order_detail.update(order_detail_params)

      if @order_detail.making_status == "in_production"
        @order.update(status: "production")
      elsif OrderDetail.where(making_status: "production_complete",order_id: @order.id).count == @order.order_details.count
        @order.update(status: "preparing")
      end
    redirect_to request.referer
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
