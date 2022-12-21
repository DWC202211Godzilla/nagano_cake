class Public::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = current_customer.cart_items.new
  end

  # private

  # def item_params
  #   params.require(:item).permit(:image,:name,:price,:introduction,:is_active)
  # end
end
