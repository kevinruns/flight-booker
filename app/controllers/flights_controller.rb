class FlightsController < ApplicationController

  def index

    @airports = Airport.all
    @flights = Flight.all

    if params[:flight]

      if params[:flight][:from_airport_id].empty? || params[:flight][:to_airport_id].empty? ||
        params[:flight][:depart_date].empty? || params[:flight][:num_passengers].empty?

        @flights_select = nil

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
