class AddColumnToDrivers < ActiveRecord::Migration[6.1]
  def change
    add_column :drivers, :car, :string
  end
end
