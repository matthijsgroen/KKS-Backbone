#= require spec_helper

describe 'Application', ->

  model = null

  beforeEach -> model = new KKSBackbone.Models.Application

  describe 'initialization', ->

    it 'triggers an initialize event', ->
      model.should.trigger('application:initialize').when -> model.initialize()

    it 'triggers an setup event', ->
      model.should.trigger('application:setup').when -> model.initialize()
