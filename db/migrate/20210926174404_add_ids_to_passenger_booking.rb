class AddIdsToPassengerBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :passenger_bookings, :passenger_id, :integer
    add_column :passenger_bookings, :booking_id, :integer
  end
end
