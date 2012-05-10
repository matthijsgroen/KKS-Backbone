
class KKSBackbone.Views.ShipmentListView extends Backbone.View

  tagName: 'table'
  className: 'table table-striped'
  template: JST['backbone/templates/shipment_list']

  initialize: ->
    @_shipmentViews = []
    @_buildRowView model for model in @model.models

    @model.on 'reset', (collection) => @_reset collection
    @model.on 'add', (model) => @$('tbody').append @_buildRowView(model).render().el
    @model.on 'remove', (model) => @_removeRowView model

  _removeRowView: (model) ->
    for view, index in @_shipmentViews when view.model is model
      @_shipmentViews.splice(index, 1)
      view.remove()
      return

  _buildRowView: (model) ->
    view = new KKSBackbone.Views.ShipmentRowView { model, tagName: 'tr' }
    @_shipmentViews.push view
    view

  _reset: (collection) ->
    shipmentView.remove() for shipmentView in @_shipmentViews
    @_shipmentViews = []
    @_buildRowView model for model in collection.models
    @render()

  render: ->
    @$el.html @template()
    @$('tbody').append shipmentView.render().el for shipmentView in @_shipmentViews
    this

