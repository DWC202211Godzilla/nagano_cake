class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items.all
    @cart_item = CartItem.new
    @item = Item.find_by(id: 1)
  end

  def update
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destroy
    cart_item = current_customer.cart_items.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    cart_items = current_customer.cart_items.all
    cart_items.destroy_all
    redirect_to request.referer
  end

  def create
    if nil != current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      @cart_item.update(amount: @cart_item.amount)
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)

      if @cart_item.save
        redirect_to cart_items_path
      else
        redirect_to request.referer
      end
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:amount,:item_id,:customer_id)
  end
end
