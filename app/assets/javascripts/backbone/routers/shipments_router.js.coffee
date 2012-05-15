
class KKSBackbone.Routers.ShipmentsRouter extends Backbone.Router

  routes:
    'shipments/:id/edit': 'edit_shipment'

  initialize: ({ @shipments }) ->
    @listView = new KKSBackbone.Views.ShipmentListView(model: @shipments)
    $('.js-shipments').append @listView.render().el

  edit_shipment: (id_code) ->
    console.log "editing #{id_code}"


KKSBackbone.app.onInitialize ->
  new KKSBackbone.Routers.ShipmentsRouter(shipments: KKSBackbone.shipments)

