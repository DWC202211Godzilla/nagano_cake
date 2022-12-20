class Order < ApplicationRecord
  belongs_to :customer


  #支払方法選択
  enum payment_method:{
    credit_card: 0,
    transfer: 1
  }

  #注文ステータス
  enum status: {
    waiting: 0,
    paid_up: 1,
    preparing: 2,
    shipped: 3
  }

  has_many :order_details
  has_many :items, through: :order_details, source: :items

end
