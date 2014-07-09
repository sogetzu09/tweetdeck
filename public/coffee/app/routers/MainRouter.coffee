define [
  'backbone.marionette'
  'app/core/App'
  'app/views/main/MainView'
], (
  Marionette
  App
  MainView
) ->


  # Controller
  # ------------------------------------------------------------------
  MainController = Marionette.Controller.extend

    getLayoutRegion: () ->
      return App.siteRegion

    showLayout: () ->
      region = @getLayoutRegion()
      if !region.currentView? or region.currentView.isClosed
        region.show new MainView()

    # Routes
    # -------------------------------------------
    baseRoute: () ->
      @showLayout()


  # Router
  # ------------------------------------------------------------------
  MainRouter = Marionette.AppRouter.extend

    appRoutes:
      '(/)': 'baseRoute'

    controller: new MainController()