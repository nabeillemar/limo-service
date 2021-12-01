class AddDateToTrips < ActiveRecord::Migration[6.1]
  def change
    add_column :trips, :reservation_date, :date
    add_column :trips, :passengers, :integer
    add_column :trips, :pick_up_time, :time
    add_column :trips, :drop_off_time, :time
  end
end
