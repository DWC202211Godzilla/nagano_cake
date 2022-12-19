class Address < ApplicationRecord
  belongs_to :customer

  validates :name, presence: true
  validates :address, presence: true , uniqueness: true
  validates :post_code, presence: true
end
