
class KKSBackbone.Views.ShipmentRowView extends Backbone.View

  tagName: 'tr'
  template: JST['backbone/templates/shipment_row']
  events:
    'dblclick': 'edit'

  render: ->
    @$el.html @template { @model }
    @$el.disableSelection()
    this

  edit: ->
    alert "opening #{@model.get('id_code')}"


