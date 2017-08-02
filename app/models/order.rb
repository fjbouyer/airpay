class Order < ApplicationRecord
  belongs_to :user
  belongs_to :reservation

  has_many :order_products
  has_many :products, through: :order_products

  validates :status, presence: true

  validates :person_quantity, presence: true
  validates :total_price_incl_vat_cents, presence: true
  validates :reservation_vat_rate, presence: true
  
  # On garde ces infos pour la facture ?
  validates :postal_code, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true

  monetize :total_price_incl_vat_cents, symbol_first: false 
end
