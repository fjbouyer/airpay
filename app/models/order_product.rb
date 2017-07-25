class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :product_price, presence: true
  validates :total_price, presence: true
  validates :vat_rate, presence: true
end
