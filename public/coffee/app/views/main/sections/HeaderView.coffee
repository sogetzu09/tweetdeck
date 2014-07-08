define [
  'backbone.marionette'
  'app/templates/main/sections/HeaderTemplate'
], (
  Marionette
  HeaderTemplate
) ->

  HeaderView = Marionette.Layout.extend
    template: HeaderTemplate