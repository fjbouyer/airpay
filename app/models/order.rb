class Order < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  has_many :order_products
  has_many :products, through: :order_products

  validates :status, presence: true
  validates :person_quantity, presence: true
  validates :total_price_cent_incl_vat, presence: true
  validates :reservation_vat_rate, presence: true
  validates :postal_code, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
end
