class SearchesController < ApplicationController

  def search
    @all_items=Item.search(params[:search])
    @items=@all_items.where(is_active: "true")
  end


end
