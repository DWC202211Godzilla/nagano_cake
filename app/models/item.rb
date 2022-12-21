class Item < ApplicationRecord
  has_many :cart_items
  has_one_attached :image
  validates :name,presence:true
  validates :introduction,presence:true,length:{maximum:200}
  validates :price,numericality: {only_integer: true}

  has_many :order_items

  has_many :order_details

  def get_image(width,height)
    unless image.attached?
      file_path = Rails.root.join("app/assets/images/no-image.jpg")
      image.attach(io: File.open(file_path),filename: "default-image.jpg" ,content_type: "image/jpeg")
    end
    image.variant(resize_to_limit: [width,height]).processed
  end

end
