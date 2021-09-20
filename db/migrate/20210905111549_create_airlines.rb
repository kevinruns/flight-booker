class CreateAirlines < ActiveRecord::Migration[6.1]
  def change
    create_table :airlines do |t|

      t.string :code
      t.text :name

      t.timestamps
    end
  end
end
