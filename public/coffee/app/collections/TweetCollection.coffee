define [
  'backbone'
  'app/core/App'
  'app/models/TweetModel'
], (
  Backbone
  App
  TweetModel
) ->

  TweetCollection = Backbone.Collection.extend
    model: TweetModel

    url: () ->
      App.api.url+'/twit/user'

    parse: (res) ->
      if res.statuses?
        return res.statuses
      return res