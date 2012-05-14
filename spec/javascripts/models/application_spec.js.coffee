#= require spec_helper

describe 'Application', ->

  model = null

  beforeEach -> model = new KKSBackbone.Models.Application

  describe 'initialization', ->

    it 'calls all callbacks set by onInitialize', ->
      callback = sinon.spy()
      model.onInitialize callback
      model.initialize()
      callback.should.have.been.called.exactly(1).time
