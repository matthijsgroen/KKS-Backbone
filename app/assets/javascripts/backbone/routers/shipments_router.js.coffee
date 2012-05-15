
class KKSBackbone.Routers.ShipmentsRouter extends Backbone.Router

  routes:
    'shipments/:id/edit': 'edit_shipment'

  initialize: ({ @shipments }) ->

    # initialize our list view. We can do this directly now since we are the only screen rendered
    @listView = new KKSBackbone.Views.ShipmentListView(model: @shipments)
    $('.js-shipments').append @listView.render().el

  edit_shipment: (id_code) ->
    model = @shipments.find (model) -> model.get('id_code') is id_code
    # add handling if model is not found
    console.log "editing #{id_code}", model.attributes

    @shipmentEditView = new KKSBackbone.Views.ShipmentEditView { model }
    @shipmentEditView.render().$el.modal()

KKSBackbone.app.onInitialize ->
  new KKSBackbone.Routers.ShipmentsRouter(shipments: KKSBackbone.shipments)

