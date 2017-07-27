class Order < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  has_many :order_products
  has_many :products, through: :order_products

  validates :status, presence: true
  validates :quantity, presence: true
  validates :total_price_excl_vat, presence: true
  validates :vat_rate, presence: true
end
