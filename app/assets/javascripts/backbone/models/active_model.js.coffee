
class KKSBackbone.Models.ActiveModel extends Backbone.Model

  human_name: (attr) ->
    I18n.t "activerecord.models.attributes.#{@i18n}.#{attr}"

