class Item < ApplicationRecord
  has_many :cart_items

  has_many :order_items

  has_many :order_details

end
