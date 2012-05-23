
class KKSBackbone.Views.ShipmentStatusView extends Backbone.View

  initialize: ->
    @collection = @model.model
    @model.on 'filter:change', (@filter) => @render()
    @collection.on 'reset change add remove', => @render()

  render: ->
    filter = {}
    filter = _.clone @filter if @filter?.destination_port?
    over10Minutes = (new Date().getTime()) + (10 * 60 * 1000)
    for status in ['arriving', 'arrived', 'sunk']
      filtered = @collection.where(_.extend({ status }, filter))
      filtered = filtered.filter((item) -> item.arrivalTime().getTime() < over10Minutes) if status is 'arriving'
      $(".js-#{status}").text(filtered.length)
    this
