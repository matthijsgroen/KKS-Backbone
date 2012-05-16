
class KKSBackbone.Routers.ShipmentsRouter extends Backbone.Router

  routes:
    'shipments/:id/edit': 'editShipment'
    'shipments/new': 'newShipment'
    'shipments': 'filterShipments'
    'shipments/:destination': 'filterShipments'

  initialize: ({ @shipments }) ->
    # initialize our list view. We can do this directly now since we are the only screen rendered
    @listView = new KKSBackbone.Views.ShipmentListView(model: @shipments)
    @filterView = new KKSBackbone.Views.ShipmentFilterView(el: $('.js-filter')[0], model: @listView)
    $('.js-shipments').append @listView.render().el

  editShipment: (id_code) ->
    model = @shipments.find (model) -> model.get('id_code') is id_code
    # add handling if model is not found
    return unless model?
    @showDialog model

  filterShipments: (destination = null) ->
    @listView.filterDestination destination

  newShipment: ->
    model = new KKSBackbone.Models.Shipment
    @showDialog model

  showDialog: (model) ->
    dialog = new KKSBackbone.Views.ShipmentEditView { model }
    dialog.render().$el.modal()
    filter_port = @listView.filter.destination_port
    dialog.$el.on 'hidden', ->
      dialog.remove()
      dialog = null
      Backbone.history.navigate(if filter_port? then "shipments/#{filter_port}" else 'shipments')

    dialog.on 'save', (model) =>
      if model.collection
        model.save()
      else
        @shipments.create model

KKSBackbone.app.on 'application:initialize', ->
  new KKSBackbone.Routers.ShipmentsRouter(shipments: KKSBackbone.shipments)

