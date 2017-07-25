class OrderReservation < ApplicationRecord
  belongs_to :reservation
  belongs_to :order
end
