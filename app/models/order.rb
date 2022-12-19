class Order < ApplicationRecord
  belongs_to :customer

  #注文ステータス
  enum status: {
    waiting: 0,
    paid_up: 1,
    preparing: 2,
    shipped: 3
  }
end
