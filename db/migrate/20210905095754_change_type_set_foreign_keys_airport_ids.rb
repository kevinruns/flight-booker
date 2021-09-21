class ChangeTypeSetForeignKeysAirportIds < ActiveRecord::Migration[6.1]
  def change
    
    change_column :flights, :from_airport_id, :integer, using: 'from_airport_id::integer'
    change_column :flights, :to_airport_id, :integer, using: 'from_airport_id::integer'

  end
end
