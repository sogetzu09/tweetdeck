define [
  'backbone'
  'underscore'
], (Backbone, _) ->

  LocaleModel = Backbone.Model.extend

    defaults:
      id: "fr"
      label: "Français"