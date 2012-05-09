class ShipmentDecorator < ApplicationDecorator
  decorates :shipment

  def as_json(options = {})
    self.model.as_json only: %w(id id_code arrival_time freighter_type destination_port origin_port), root: false
  end
end
