class Public::ItemsController < ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  
  def index
    @items = Item.where('is_active = true').page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    if customer_signed_in?
      @cart_item = current_customer.cart_items.new
    end
    redirect_to items_path unless @item.is_active == true
  end
end
