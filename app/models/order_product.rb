class OrderProduct < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, presence: true
  validates :product_price_cent_incl_vat, presence: true
  validates :product_vat_rate, presence: true
end
