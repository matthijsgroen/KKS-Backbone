#= require spec_helper

describe 'ShipmentsRouter', ->

  router = null
  beforeEach ->
    router = new KKSBackbone.Routers.ShipmentsRouter(shipments: new Backbone.Collection)

  describe 'routing', ->

    it 'handles shipment edit paths', ->
      'shipments/123/edit'.should.route_to router, 'edit_shipment', arguments: ['123']
