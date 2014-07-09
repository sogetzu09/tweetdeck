define [
  'backbone.marionette'
  'app/templates/main/partials/tweetfeed/TweetFeedTemplate'
  'app/views/main/partials/tweetfeed/TweetFeedListItemView'
  'app/collections/TweetCollection'
], (
  Marionette
  TweetFeedTemplate
  TweetFeedListItemView
  TweetCollection
) ->

  TweetFeedView = Marionette.CompositeView.extend
    template: TweetFeedTemplate

    itemView: TweetFeedListItemView
    itemViewContainer: '.list-tweetfeed'

    options:
      screen_name: 'techcrunch'
      # result_type: 'recent'
      count: 30


    initialize: () ->
      if !@collection?
        @collection = new TweetCollection()
        @collection.fetch
          data: @getFetchDataQuery()
          

    # Render
    # --------------------------------
    onRender: () ->
      @setElement @$el.children()

    templateHelpers: () ->
      data = 
        screen_name: @options.screen_name

    itemViewOptions: (model, index) ->
      data =
        index: index

    # Data
    # --------------------------------
    getFetchDataQuery: () ->
      data =
        screen_name: @options.screen_name
        # result_type: @options.result_type
        count: @options.count