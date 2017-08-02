class Reservation < ApplicationRecord
  belongs_to :sport_category
  belongs_to :creator, class_name: User, foreign_key: :user_id
  has_many :orders

  validates :date, presence: true
  validates :time, presence: true
  validates :number_of_hour, presence: true
  validates :price_per_hour_incl_vat_cents, presence: true
  validates :vat_rate, presence: true

  monetize :price_per_hour_incl_vat_cents, symbol_first: false 
end
