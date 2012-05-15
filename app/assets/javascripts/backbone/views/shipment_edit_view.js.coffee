
class KKSBackbone.Views.ShipmentEditView extends Backbone.View

  className: 'modal fade'
  template: JST['backbone/templates/edit_shipment']
  events:
    'click .js-close': 'restoreValues'
    'click .js-save': 'saveValues'

  initialize: ->
    @currentAttributes = _.clone @model.attributes

  render: ->
    @$el.html @template({ @model })
    @$el.backboneLink @model
    this

  restoreValues: ->
    @model.set @currentAttributes
    @$el.modal('hide')

  saveValues: ->
    @trigger 'save', @model
    @$el.modal('hide')

