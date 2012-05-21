
class KKSBackbone.Views.ShipmentRowView extends Backbone.View

  tagName: 'tr'
  template: JST['backbone/templates/shipment_row']
  events:
    'dblclick td': 'edit'
    'click td.js-ship-state': 'selectState'

  initialize: ->
    @model.on 'change', => @render()

  render: ->
    @$el.html @template { @model }
    @updateTime()
    @$el.disableSelection()
    this

  updateTime: ->
    date = $.timeago.parse(@model.get('arrival_time'))
    distance = (new Date().getTime() - date.getTime())
    if distance > 0
      @$el.removeClass 'warning'
      if @model.get('state') is 'unknown'
        @$('.timeago').text('sunk')
      else
        @$('.timeago').text('arrived')
    else
      @$('.timeago').text($.timeago.inWords distance)
      @$el.addClass('warning') if distance > -60000

  edit: ->
    Backbone.history.navigate("shipments/#{@model.get('id_code')}/edit", trigger: yes)

  selectState: ->
    @model.set state: 'docked'
    @model.save()
