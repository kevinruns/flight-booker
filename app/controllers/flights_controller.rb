class FlightsController < ApplicationController

  def index

    @airports = Airport.all
    @flights = Flight.all

    if params[:flight]
 
      # removes fields user did not select (e.g. origin: '')
      params[:flight].delete_if { |_k, v| v.empty? }

      if params[:flight].empty?
        @flights_select = Flight.all.includes(:from_airport, :to_airport).order(:depart_date).limit(100)
      else
        @flights_select = Flight.where(flight_params).includes(:from_airport, :to_airport).order(:depart_date, :depart_time).limit(100)
      end

    end
    
  end

  def flight_params
    params.require(:flight).permit(:from_airport_id, :to_airport_id, :depart_date)
  end

  def search_params
    params.require(:flight).permit(:origin_id, :destination_id, :date, :tickets)
  end
  
end
