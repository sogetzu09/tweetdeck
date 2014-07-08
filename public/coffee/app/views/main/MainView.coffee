define [
  'backbone.marionette'
  'app/core/App'
  'app/templates/main/MainTemplate'
  'app/views/main/sections/HeaderView'
  'app/views/main/sections/FooterView'
], (
  Marionette
  App
  MainTemplate
  HeaderView
  FooterView
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
      # @heroRegion.show new HeroView()
      @footerRegion.show new FooterView()

    # Events
    # ------------------------------------------------------------
    bindAppEvents: () ->
      # App.channels.main.commands.setHandler 'main:section:scrollto', (id) =>
      #   @onSectionScrollToCommand id