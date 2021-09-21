class AddColumnTimeToFlights < ActiveRecord::Migration[6.1]
  def change
    add_column :flights, :depart_time, :time
  end
end
