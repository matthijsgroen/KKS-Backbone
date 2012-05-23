class ShipmentObserver < ActiveRecord::Observer
  observe :shipment

  def after_update shipment
    publish :update, shipment
  end

  def after_create shipment
    publish :create, shipment
  end

  def after_destroy shipment
    publish :destroy, shipment
  end

  private
  def publish type, record
    Juggernaut.publish 'shipments', {
      action: type,
      record: ShipmentDecorator.new(record).as_json
    }
  end
end
