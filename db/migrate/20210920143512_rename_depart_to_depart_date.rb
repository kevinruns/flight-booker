class RenameDepartToDepartDate < ActiveRecord::Migration[6.1]
  def change
    rename_column :flights, :depart, :depart_date
  end
end
