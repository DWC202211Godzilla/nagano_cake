class Order < ApplicationRecord
  belongs_to :customer


  #支払方法選択
  enum payment_method: {
    credit_card: 0,
    transfer: 1
  }

  #注文ステータス
  enum status: {
    waiting: 0,
    paid_up: 1,
    production: 2,
    preparing: 3,
    shipped: 4
  }

  has_many :order_details

end
