class ChangeAirlineToAirlineId < ActiveRecord::Migration[6.1]
  def change

    rename_column :flights, :airline, :airline_id
   
  end
end
