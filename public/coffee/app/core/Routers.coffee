define [
  'backbone.marionette'
  'app/core/App'
  'app/routers/MainRouter'
], (
  Marionette
  App
  MainRouter
) ->

  App.routers =
    default: new Marionette.AppRouter

  App.addInitializer (options={}) ->
    App.routers.mainRouter = new MainRouter()
    hijackLinks()


  App.commands.setHandler 'navigate', (route) ->
    App.routers.default.navigate route,
      trigger: true
  

  hijackLinks = () ->
    $ () ->
      $(document).delegate 'a', 'click', (e) ->
        return  if $(this).attr('target') is '_blank'

        href = $(this).attr 'href'
        return if !href?
        found = false
        reserved = ['#','mailto','tel','http','https','javascript']
        _.each reserved, (value, key) ->
          lg = value.length
          return found = true if href.substring(0,lg) is value

        e.preventDefault()  if href is '#'
        return  if found

        e.preventDefault()
        App.commands.execute 'navigate', href


  # bindSessionEvents = () ->
  #   LocaleSessionModel.on 'change', () ->
  #     window.location = window.location


  return App
