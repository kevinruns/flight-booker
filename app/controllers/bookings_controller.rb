class BookingsController < ApplicationController

  def new

#    flight ID and passenger number parameters
    @flight = Flight.find(params[:flight_id])
    num_passengers = params[:num_passengers].to_i

    @booking = Booking.new
    num_passengers.times { @booking.passengers.build }

  end


  def create

    @booking = Booking.new(booking_params)

  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :first_name, :family_name, :email])
  end

end