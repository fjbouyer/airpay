class Reservation < ApplicationRecord
  belongs_to :sport_category
  belongs_to :user
end
