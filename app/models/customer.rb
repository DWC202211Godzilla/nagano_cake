class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders
  has_many :addresses
  has_many :cart_items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
