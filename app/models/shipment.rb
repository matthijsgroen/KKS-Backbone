class Shipment < ActiveRecord::Base
  attr_accessible :arrival_time, :destination_port, :freighter_type, :id_code, :origin_port
end
