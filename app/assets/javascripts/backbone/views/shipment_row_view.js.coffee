
class KKSBackbone.Views.ShipmentRowView extends Backbone.View

  tagName: 'tr'
  template: JST['backbone/templates/shipment_row']
  events:
    'dblclick td': 'edit'
    'click td.js-ship-state': 'selectState'

  initialize: ->
    @model.on 'change', (->
      @render()
    ), this

  render: ->
    @$el.html @template { @model }
    @updateTime()
    @$el.disableSelection()
    this

  updateTime: ->
    distance = (new Date().getTime() - @model.arrivalTime().getTime())
    state = @model.calculateStatus()
    if state is 'arriving'
      @$('.timeago').text($.timeago.inWords distance)
      @$el.addClass('warning') if distance > -60000
    else
      @$el.removeClass 'warning'
      @$('.timeago').text(state)

  edit: ->
    Backbone.history.navigate("shipments/#{@model.get('id_code')}/edit", trigger: yes)

  selectState: ->
    @model.set state: 'docked'
    @model.save()
