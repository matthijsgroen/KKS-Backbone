
class KKSBackbone.Views.CollectionView extends Backbone.View

  initialize: ->
    @_itemViews = []
    @_buildItemView model for model in @model.models

    @model.on 'reset', (collection) => @_resetItemViews collection
    @model.on 'add', (model) => @trigger 'addItemView', @_buildItemView(model)
    @model.on 'remove', (model) => @_removeViewForModel model

  _removeViewForModel: (model) ->
    for view, index in @_itemViews when view.model is model
      delete @_itemViews[index]
      @_removeItemView view
      return

  _removeAllItemViews: ->
    @_removeItemView itemView for itemView in @_itemViews
    @_itemViews = []

  _removeItemView: (view) ->
    view.remove()
    view.off()
    view = null

  _buildItemView: (model) ->
    view = new @itemView _.extend({ model }, @itemOptions)
    @_itemViews.push view
    view

  _resetItemViews: (collection) ->
    @_removeAllItemViews()
    @_buildItemView model for model in collection.models
    @render()

  renderItems: ->
    itemView.render().el for itemView in @_itemViews

