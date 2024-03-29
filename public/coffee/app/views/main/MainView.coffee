define [
  'backbone.marionette'
  'app/templates/main/MainTemplate'
  'app/views/main/sections/HeaderView'
  'app/views/main/sections/FooterView'
  'app/views/main/sections/TweetDeckView'
], (
  Marionette
  MainTemplate
  HeaderView
  FooterView
  TweetDeckView
) ->

  MainView = Marionette.Layout.extend
    template: MainTemplate

    regions:
      headerRegion: '.section-header'
      pageRegion: '.section-page'
      footerRegion: '.section-footer'

    initialize: () ->
      if !@collection?
        @collection = new Backbone.Collection [
          screen_name: 'AppDirect'
        ,
          screen_name: 'laughingsquid'    
        ,
          screen_name: 'techcrunch'
        ]

    # Render
    # ------------------------------------------------------------
    onShow: () ->
      @headerRegion.show new HeaderView()
      @footerRegion.show new FooterView()
      @pageRegion.show new TweetDeckView
        collection: @collection