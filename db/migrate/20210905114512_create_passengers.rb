class CreatePassengers < ActiveRecord::Migration[6.1]
  def change
    create_table :passengers do |t|

      t.string :first_name
      t.string :family_name
      t.string :email

      t.timestamps
    end
  end
end
