class Product < ApplicationRecord
  belongs_to :product_category

  validates :name, presence: true
  validates :price_incl_vat_cents, presence: true
  validates :vat_rate, presence: true

  monetize :price_incl_vat_cents, symbol_first: false 
end
