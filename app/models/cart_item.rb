class CartItem < ApplicationRecord
  belongs_to :item

  #税込の計算メソッド
  def sum_price
    item.taxin_price*quantity
  end
end
