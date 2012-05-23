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
  KKSBackbone.app.on 'application:initialize', (app) ->
    app.juggernaut = new Juggernaut
    app.juggernaut.subscribe 'shipments', (data) ->
      switch data.action
        when 'create'
          model = app.shipments.get(data.record.id)
          if model?
            model.set data.record
          else
            app.shipments.create data.record
        when 'update'
          model = app.shipments.get(data.record.id)
          model.set data.record
        when 'destroy'
          app.shipments.remove data.record

    console.log 'subscribed to :shipments'

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


