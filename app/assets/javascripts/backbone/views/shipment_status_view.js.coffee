
class KKSBackbone.Views.ShipmentStatusView extends Backbone.View

  initialize: ->
    @collection = @model.model
    @model.on 'filter:change', (@filter) => @render()
    @collection.on 'reset change add remove', => @render()

  render: ->
    filter = {}
    filter = _.clone @filter if @filter?.destination_port?
    for status in ['arriving', 'arrived', 'sunk']
      $(".js-#{status}").text(@collection.where(_.extend({ status }, filter)).length)
    this
