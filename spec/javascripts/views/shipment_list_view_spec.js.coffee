#= require spec_helper

describe 'ShipmentListView', ->

  view = null
  collection = null
  dom = null

  beforeEach ->
    collection = new Backbone.Collection
    collection.reset [{
      id: '1'
      id_code: 'KKS-1'
      arrival_time: '2012-05-20T20:10:20'
      freighter_type: 'ldm34'
      destination_port: 'Rotterdam'
      origin_port: 'Antwerp'
    }, {
      id: '2'
      id_code: 'KKS-2'
      arrival_time: '2012-05-20T20:10:20'
      freighter_type: 'ldm34'
      destination_port: 'Rotterdam'
      origin_port: 'Honolulu'
    }]

    view = new KKSBackbone.Views.ShipmentListView model: collection
    dom = $('#konacha')
    dom.append view.render().el

  it 'renders a table', ->
    dom.should.contain('table')

  it 'has a table header', ->
    dom.should.contain('table thead tr')

  it 'contains rows for each shipment', ->
    dom.find('table tbody tr').should.have.length(2)

