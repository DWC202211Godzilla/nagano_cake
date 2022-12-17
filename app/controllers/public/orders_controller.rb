class Public::OrdersController < ApplicationController
  def new
  end

  def confirm
  end

  def complete
  end

  def create
  end

  def index
    @orders = Order.page(params[:page])
  end

  def show
    @orders = Order.page(params[:page])
  end
end
