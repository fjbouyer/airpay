class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :product_price_incl_vat_cents, presence: true
  validates :product_vat_rate, presence: true
end
