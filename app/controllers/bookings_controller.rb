class BookingsController < ApplicationController

  def new

#    flight ID and passenger number parameters
    @flight = Flight.find(params[:flight_id])
    num_passengers = params[:num_passengers].to_i

    @booking = Booking.new
    num_passengers.times { @booking.passengers.build }

  end


  def create
    # check if passenger exists via email
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to @booking
    else
      render :new
    end
  end

  def show
    @booking = Booking.find_by(id: params[:id])
    if @booking
      render :show
    else
#      flash[:alert] = 'Sorry, the booking you\'re looking for does not exist.'
      redirect_to root_url
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :first_name, :family_name, :email])
  end

end