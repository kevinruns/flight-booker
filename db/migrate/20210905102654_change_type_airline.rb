class ChangeTypeAirline < ActiveRecord::Migration[6.1]
  def change
    change_column :flights, :airline, :integer  
  end
end
