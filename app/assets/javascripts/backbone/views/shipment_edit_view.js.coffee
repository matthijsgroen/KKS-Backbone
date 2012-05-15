
class KKSBackbone.Views.ShipmentEditView extends Backbone.View

  className: 'modal fade'
  template: JST['backbone/templates/edit_shipment']

  render: ->
    @$el.html @template({ @model })
    this

