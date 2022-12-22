class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  
  def index
    @items = Item.where('is_active = true').page(params[:page])
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_customer.cart_items.new
    redirect_to items_path unless @item.is_active == true
  end
end
