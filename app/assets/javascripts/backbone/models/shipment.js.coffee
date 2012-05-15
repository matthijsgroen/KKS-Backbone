
class KKSBackbone.Models.Shipment extends KKSBackbone.Models.ActiveModel
  i18n: 'shipment'

  toJSON: ->
    { 'shipment': super }

class KKSBackbone.Collections.ShipmentCollection extends Backbone.Collection
  model: KKSBackbone.Models.Shipment
  url: '/api/shipments'
