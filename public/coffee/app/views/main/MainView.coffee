define [
  'backbone.marionette'
  'app/core/App'
  'app/templates/main/MainTemplate'
  'app/views/main/sections/HeaderView'
  'app/views/main/sections/FooterView'
  'app/views/main/partials/tweetfeed/TweetFeedView'
  'app/collections/TweetCollection'
], (
  Marionette
  App
  MainTemplate
  HeaderView
  FooterView
  TweetFeedView
  TweetCollection
) ->

  MainView = Marionette.Layout.extend
    template: MainTemplate

    regions:
      headerRegion: '.section-header'
      pageRegion: '.section-page'
      footerRegion: '.section-footer'


    # Render
    # ------------------------------------------------------------
    onShow: () ->
      @headerRegion.show new HeaderView()
      @footerRegion.show new FooterView()

      @pageRegion.show new TweetFeedView
        # collection: tweetCollection
        screen_name: 'techcrunch'


    # Events
    # ------------------------------------------------------------
    bindAppEvents: () ->
      # App.channels.main.commands.setHandler 'main:section:scrollto', (id) =>
      #   @onSectionScrollToCommand id