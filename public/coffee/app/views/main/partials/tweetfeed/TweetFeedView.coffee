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
    itemViewContainer: '.list-tweet'

    options:
      screen_name: 'techcrunch'
      count: 30
      showSpinnerOnRender: false

    ui:
      'spinner': '.icon-spinner'

    initialize: () ->
      if !@collection?
        @options.showSpinnerOnRender = true
        @collection = new TweetCollection()
        @collection.fetch
          data: @getFetchDataQuery()
          success: () =>
            @hideSpinner()
          error: () =>
            @hideSpinner()
          

    # Render
    # --------------------------------
    onRender: () ->
      @setElement @$el.children()
      if @options.showSpinnerOnRender
        @showSpinner()
      else
        @hideSpinner()

    templateHelpers: () ->
      data = 
        screen_name: @options.screen_name
        user_url: tweet_url = 'http://twitter.com/'+@options.screen_name
        active: (@options.index is 0)

    itemViewOptions: (model, index) ->
      data =
        index: index


    # Data
    # --------------------------------
    getFetchDataQuery: () ->
      data =
        screen_name: @options.screen_name
        count: @options.count

    # Spinner
    # --------------------------------
    showSpinner: () ->
      @ui.spinner.removeClass 'hidden'
    hideSpinner: () ->
      @ui.spinner.addClass 'hidden'

