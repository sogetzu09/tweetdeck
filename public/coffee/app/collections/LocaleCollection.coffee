define [
  'backbone'
  'app/models/LocaleModel'
], (Backbone, LocaleModel) ->

  LocaleCollection = Backbone.Collection.extend
    model: LocaleModel