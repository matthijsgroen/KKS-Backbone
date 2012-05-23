
class KKSBackbone.Models.Shipment extends KKSBackbone.Models.ActiveModel
  i18n: 'shipment'

  toJSON: ->
    json = super
    delete json['id']
    { 'shipment': json }

  initialize: ->
    @on 'change:state', => @collection.sort()

  calculateStatus: ->
    date = $.timeago.parse(@get('arrival_time'))
    distance = (new Date().getTime() - date.getTime())
    if distance > 0
      if @get('state') is 'unknown'
        @set(status: 'sunk')
      else
        @set(status: 'arrived')
    else
      @set(status: 'arriving')
    @get('status')

class KKSBackbone.Collections.ShipmentCollection extends Backbone.Collection
  model: KKSBackbone.Models.Shipment
  url: '/api/shipments'
  comparator: (shipment) ->
    val = switch shipment.get('state')
      when 'unknown' then '1'
      when 'parked' then '2'
      when 'docked' then '3'

    "#{val}#{shipment.get('arrival_time')}"
