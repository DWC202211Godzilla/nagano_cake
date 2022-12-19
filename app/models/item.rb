class Item < ApplicationRecord
  has_many :cart_items
  has_one_attached :image
  validates :name,presence:true
  validates :introduction,presence:true,length:{maximum:200}
  validates :price,numericality: {only_integer: true}
end
