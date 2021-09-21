class AddColumnFlightNumberToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :flight_number, :string
  end
end
