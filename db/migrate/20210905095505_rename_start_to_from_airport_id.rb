class RenameStartToFromAirportId < ActiveRecord::Migration[6.1]
  def change
    rename_column :flights, :start, :from_airport_id
    rename_column :flights, :finish, :to_airport_id
  end
end
