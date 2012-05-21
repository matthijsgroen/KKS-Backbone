
class KKSBackbone.Models.Shipment extends KKSBackbone.Models.ActiveModel
  i18n: 'shipment'

  toJSON: ->
    json = super
    delete json['id']
    { 'shipment': json }

  initialize: ->
    @on 'change:state', => @collection.sort()

class KKSBackbone.Collections.ShipmentCollection extends Backbone.Collection
  model: KKSBackbone.Models.Shipment
  url: '/api/shipments'
  comparator: (shipment) ->
    val = switch shipment.get('state')
      when 'unknown' then '1'
      when 'parked' then '2'
      when 'docked' then '3'

    "#{val}#{shipment.get('arrival_time')}"
