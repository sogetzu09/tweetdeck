define [
  'backbone.marionette'
  'app/templates/main/sections/TweetDeckTemplate'
  'app/views/main/partials/tweetfeed/TweetFeedView'
], (
  Marionette
  TweetDeckTemplate
  TweetFeedView
) ->

  TweetDeckView = Marionette.CompositeView.extend
    template: TweetDeckTemplate

    itemView: TweetFeedView
    itemViewContainer: '.list-tweetfeed'

    # Render
    # --------------------------------
    itemViewOptions: (model, index) ->
      data =
        index: index
        screen_name: model.get 'screen_name'