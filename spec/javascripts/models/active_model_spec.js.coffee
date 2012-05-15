#= require spec_helper

describe "ActiveModel", ->

  model = null

  beforeEach ->
    class ActiveModelImpl extends KKSBackbone.Models.ActiveModel
      i18n: 'my_model'

    model = new ActiveModelImpl

  describe '#human_name', ->

    it 'uses the active record translations', ->
      mock = sinon.mock I18n
      mock.expects('t').withExactArgs('activerecord.models.attributes.my_model.my_attr')

      model.human_name('my_attr')
      mock.verify()


