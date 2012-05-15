#= require_self
#= require ./models/application
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
  KKSBackbone.app.initialize()

