class Item < ApplicationRecord
  has_many :cart_items
  has_one_attached :image
  validates :name,presence:true
  validates :introduction,presence:true,length:{maximum:200}
  validates :price,numericality: {only_integer: true},presence:true
  validates :image, presence:true

  has_many :order_details
  belongs_to :genre


  def self.search(search)
    if search != nil
      Item.where(['name LIKE ?', "%#{search}"])
    else
      Item.all
    end
  end

end
