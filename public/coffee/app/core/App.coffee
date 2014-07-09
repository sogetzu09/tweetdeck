define [
  'backbone.marionette'
], (
  Marionette
) ->

  App = new Backbone.Marionette.Application()

  App.api = 
    url: ''

  App.addRegions
    siteRegion: '.region-site'

  App.on 'initialize:after', (options) ->
    Backbone.history.start
      pushState: true

  return App