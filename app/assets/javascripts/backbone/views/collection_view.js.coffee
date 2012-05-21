
class KKSBackbone.Views.CollectionView extends Backbone.View

  initialize: ->
    @filter = {}
    @_itemViews = []
    @_buildItemView model for model in @model.models

    @model.on 'reset', (collection) => @_resetItemViews collection
    @model.on 'add', (model) =>
      view = @_buildItemView(model)
      @trigger('addItemView', view) if @matchFilter(model)
    @model.on 'remove', (model) => @_removeViewForModel model
    $(window).on 'resize', => @render()

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

  renderItems: (element) ->
    for itemView in @_itemViews when @matchFilter(itemView.model)
      @$(element).append(itemView.render().el)
      itemView.delegateEvents()
      if $(window).height() <= $('body').outerHeight()
        itemView.remove()
        return

  refreshItems: ->
    itemView.render() for itemView in @_itemViews

  matchFilter: (model) ->
    return no for field, value of @filter when (model.get(field) isnt value) and value?
    yes

