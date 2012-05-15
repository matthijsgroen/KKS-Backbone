
class KKSBackbone.Models.Application

  initialize: ->
    @trigger('application:setup', KKSBackbone)
    @trigger('application:initialize', KKSBackbone)
    Backbone.history?.start(pushState: yes) unless Backbone.History.started

_.extend KKSBackbone.Models.Application.prototype, Backbone.Events

KKSBackbone.app = new KKSBackbone.Models.Application
