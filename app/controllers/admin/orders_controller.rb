class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.page(params[:page])
  end

  def update
    @orders = Order.all
  end
end
