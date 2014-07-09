define [
  'backbone.marionette'
  'app/templates/main/partials/tweetfeed/TweetFeedListItemTemplate'
  'moment'
], (
  Marionette
  TweetFeedListItemTemplate
  moment
) ->

  TweetFeedListItemView = Marionette.Layout.extend
    template: TweetFeedListItemTemplate

    # Render
    # ------------------------------------------------------------
    onRender: () ->
      @setElement @$el.children()

    templateHelpers: () ->

      tweet_url = 'http://twitter.com/'+@model.get('user').screen_name+'/status/'+@model.get('id_str')
      timeago = moment.utc( @model.get('created_at') ).local().fromNow()

      if @model.get('in_reply_to_screen_name')?
        reply = @model.get('in_reply_to_screen_name')

      if @model.get('retweeted_status')?
        retweet = @model.get('retweeted_status').user.screen_name

      if @model.get('entities')? and @model.get('entities').user_mentions? and @model.get('entities').user_mentions.length
        mentions = @model.get('entities').user_mentions

      data =
        index: @options.index || 0
        tweet: @model.toJSON()
        timeago: timeago
        tweet_url: tweet_url
        reply: reply
        retweet: retweet
        mentions: mentions