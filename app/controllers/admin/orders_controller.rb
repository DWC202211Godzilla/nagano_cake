class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
  end

  def update
    @order = Order.find(params[:id])
<<<<<<< HEAD
<<<<<<< HEAD
    @order_details = @order.order_details.all

    if params[:status]
      @order.update(order_params)
      redirect_to admin_order_path(@order)
    end

    if params[:making_status]
    end

=======
=======
>>>>>>> origin/develop
    @order.update(order_params)

    if @order.status == "paid_up"
      @order.order_details.each do |order_detail|
        order_detail.update(making_status: "production_pending")
      end
    end

    redirect_to request.referer
<<<<<<< HEAD
>>>>>>> origin/develop
=======
>>>>>>> origin/develop
  end


  private
  def order_params
    params.require(:order).permit(:status)
  end
end
