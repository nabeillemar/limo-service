class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :client_name
      t.string :pick_up
      t.string :drop_off

      t.timestamps
    end
  end
end
