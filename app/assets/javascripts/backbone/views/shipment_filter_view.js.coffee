
class KKSBackbone.Views.ShipmentFilterView extends Backbone.View

  template: JST['backbone/templates/filter']

  initialize: ->
    @collection = @model.model
    @collection.on 'change add remove', (-> @render()), this
    @model.on 'filter:change', ((filter) ->
      @destination = filter.destination_port
      @render()), this

  render: ->
    if @destination?
      @$('.dropdown-toggle').html I18n.t('shipments.filter.port', port: @destination)
    else
      @$('.dropdown-toggle').html I18n.t('shipments.filter.no_port')
    @$('ul').html @template items: @populateOptions()

    this

  populateOptions: ->
    _.uniq(@collection.pluck('destination_port')).sort()

