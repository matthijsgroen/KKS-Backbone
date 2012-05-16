
class KKSBackbone.Views.ShipmentRowView extends Backbone.View

  tagName: 'tr'
  template: JST['backbone/templates/shipment_row']
  events:
    'dblclick td': 'edit'

  initialize: ->
    @model.on 'change', => @render()

  render: ->
    @$el.html @template { @model }
    @$el.disableSelection()
    @$('.timeago').timeago(allowFuture: yes)
    this

  edit: ->
    Backbone.history.navigate("shipments/#{@model.get('id_code')}/edit", trigger: yes)


