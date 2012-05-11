#= require ./collection_view
#= require ./shipment_row_view

class KKSBackbone.Views.ShipmentListView extends KKSBackbone.Views.CollectionView

  tagName: 'table'
  className: 'table table-striped'
  template: JST['backbone/templates/shipment_list']
  itemView: KKSBackbone.Views.ShipmentRowView
  itemOptions:
    tagName: 'tr'

  initialize: ->
    super
    @on 'addItemView', (itemView) -> @$('tbody').append itemView.render().el

  render: ->
    @$el.html @template()
    @$('tbody').append @renderItems()
    this

