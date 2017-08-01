class Product < ApplicationRecord
  belongs_to :product_category

  validates :name, presence: true
  validates :price_incl_vat, presence: true
  validates :vat_rate, presence: true
end
