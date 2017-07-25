class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :reservations

  has_many :orders
  has_many :joined_reservations, through: :orders, source: :reservation

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :postal_code, presence: true
  validates :phone_number, presence: true
  validates :email, presence: true
end
