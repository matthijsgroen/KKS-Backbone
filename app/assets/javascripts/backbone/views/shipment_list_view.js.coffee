
class KKSBackbone.Views.ShipmentListView extends Backbone.View

  tagName: 'table'
  className: 'table table-striped'
  template: JST['backbone/templates/shipment_list']

  initialize: ->
    @_shipmentViews = []
    @_shipmentViews.push new KKSBackbone.Views.ShipmentRowView { model, tagName: 'tr' } for model in @model.models

  render: ->
    @$el.html @template()
    @$('tbody').append shipmentView.render().el for shipmentView in @_shipmentViews
    this

