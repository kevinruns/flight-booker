class Booking < ApplicationRecord

  belongs_to :flight

  has_many :passenger_bookings, dependent: :delete_all
  has_many :passengers, through: :passenger_bookings, inverse_of: :bookings

  accepts_nested_attributes_for :passengers

end
