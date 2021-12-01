class AddColumnToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :user_id, :integer
    add_column :trips, :driver_id, :integer
  end
end
