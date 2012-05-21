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

$ ->
  KKSBackbone.app.on 'application:setup', (app) ->
    app.shipments = new app.Collections.ShipmentCollection

  KKSBackbone.app.initialize()

  # convert hard links to backbone navigation
  $('body').on 'click', 'a', (event) ->
    url = $(this).attr('href')
    if url[0] is '/'
      Backbone.history.navigate url, trigger: yes
      event.preventDefault()
      false

  jQuery.timeago.settings.allowFuture = yes
  jQuery.timeago.settings.strings.seconds = "%d seconds"
  jQuery.timeago.settings.refreshMillis = 0
  $('time.timeago').timeago()


