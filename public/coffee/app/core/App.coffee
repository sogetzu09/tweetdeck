define [
  'backbone.marionette'
  'backbone.wreqr'
], (
  Marionette
  Wreqr
) ->

  App = new Backbone.Marionette.Application()

  App.addRegions
    siteRegion: '.region-site'
    modalRegion: '.region-modal'
    pageRegion: '.region-page'

  App.channels =
    main: Wreqr.radio.channel 'main'


  App.on 'initialize:after', (options) ->
    Backbone.history.start
      pushState: true

  return App