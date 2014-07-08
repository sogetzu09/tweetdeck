define [
  'backbone'
  'app/core/App'
], (
  Backbone
  App
) ->

  TweetModel = Backbone.Model.extend

    urlRoot: () ->
      App.api.url+'/twit/user'