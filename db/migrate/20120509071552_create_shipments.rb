class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.string :id_code
      t.datetime :arrival_time
      t.string :destination_port
      t.string :origin_port
      t.string :freighter_type

      t.timestamps
    end
  end
end
