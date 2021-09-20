class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :start
      t.string :finish
      t.datetime :depart
      t.integer :duration
      t.string :airline

      t.timestamps
    end
  end
end
