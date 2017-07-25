class Reservation < ApplicationRecord
  belongs_to :sport_category
  belongs_to :creator, class_name: User, foreign_key: :user_id

  validates :date, presence: true
  validates :time, presence: true
  validates :number_of_hour, presence: true
  validates :price_per_hour_excl_vat, presence: true
  validates :vat_rate, presence: true
end
