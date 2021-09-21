class ChangeDepartDateToDateInFlights < ActiveRecord::Migration[6.1]
  def change
    change_column :flights, :depart_date, :date
  end
end
