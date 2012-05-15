
class KKSBackbone.Models.Application extends Backbone.Events

  constructor: ->
    @initializers = []

  onInitialize: (callback) ->
    @initializers.push callback

  initialize: ->
    initialize() for initialize in @initializers
    Backbone.history?.start(pushState: yes) unless Backbone.History.started


KKSBackbone.app = new KKSBackbone.Models.Application
