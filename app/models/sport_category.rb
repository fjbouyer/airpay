class SportCategory < ApplicationRecord
  validates :name, presence: true

  has_many :reservations
end
