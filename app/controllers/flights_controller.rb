class FlightsController < ApplicationController

  def index

    @airports = Airport.all
    @flights = Flight.all


    if params[:flight]
      # removes fields user did not select (e.g. origin: '')
      params[:flight].delete_if { |_k, v| v.empty? }
      @flights_select = (params[:flight].empty? ? Flight.all : Flight.where(flight_params)).includes(:origin, :destination).order(:date, :time).limit(1000)
    end
    
  end

  def flight_params
    params.require(:flight).permit(:from_airport_id, :to_airport_id, :depart_date, :num_passengers)
  end

  def search_params
    params.require(:flight).permit(:origin_id, :destination_id, :date, :tickets)
  end
  
end
