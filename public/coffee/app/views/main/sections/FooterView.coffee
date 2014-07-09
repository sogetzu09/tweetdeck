define [
  'backbone.marionette'
  'app/templates/main/sections/FooterTemplate'
], (
  Marionette
  FooterTemplate
) ->

  FooterView = Marionette.ItemView.extend
    template: FooterTemplate

    templateHelpers: () ->
      data = 
        year: new Date().getFullYear()