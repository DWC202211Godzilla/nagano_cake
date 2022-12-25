class CartItem < ApplicationRecord
  belongs_to :item

  #税込の計算メソッド
  def sum_price
    (item.price*1.1).round(ndigits = 0)
  end
end
