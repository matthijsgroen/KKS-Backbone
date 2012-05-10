#= require_self
#= require hamlcoffee
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.KKSBackbone =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}

  shipments: new Backbone.Collection

$ ->
  $('.js-shipments').append new KKSBackbone.Views.ShipmentListView(model: KKSBackbone.shipments).render().el
