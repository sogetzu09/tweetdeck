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

    ui: 
      dropdownBtn: '.dropdown-menu a'

    # Render
    # --------------------------------
    templateHelpers: () ->
      data =
        feeds: @collection.toJSON()

    itemViewOptions: (model, index) ->
      data =
        index: index
        screen_name: model.get 'screen_name'


    # Events
    # --------------------------------
    events: 
      'click @ui.dropdownBtn': 'onDropdownClick'

    onDropdownClick: (e) ->
      $btn = $(e.currentTarget)
      id = $btn.attr 'data-id'
      feeds = @$el.find '.tweetfeed'
      feeds.removeClass 'active'
      feeds.filter('[data-id="'+id+'"]').addClass 'active'
