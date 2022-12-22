class Public::ItemsController < ApplicationController
  def index
    @items = Item.where('is_active = true').page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_customer.cart_items.new
    redirect_to items_path unless @item.is_active == true
  end
end
