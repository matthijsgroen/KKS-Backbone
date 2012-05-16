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
    @filter =
      destination_port: null
    @on 'addItemView', (itemView) -> @$('tbody').append itemView.render().el

  filterDestination: (destination) ->
    @filter.destination_port = destination
    @trigger 'filter:change', @filter
    @render()

  render: ->
    @$el.html @template()
    @renderItems('tbody')
    this

