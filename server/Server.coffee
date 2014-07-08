###
# Dependencies
###

_             = require 'lodash'
express       = require 'express'
http          = require 'http'
path          = require 'path'
url           = require 'url'
fs            = require 'fs-extra'
Twit          = require 'twit'


class Server

  app: null
  server: null

  constructor: (options) ->
    _.extend @options, options

    @server_port     = process.env.PORT || 8080
    if process.argv[2] is 'dev'
      @public_path = path.join(__dirname, '../.public')
    else
      @public_path = path.join(__dirname, '../public')

    @init()


  init: () ->
    @initTwit () =>
      @initServer () =>
        console.log 'Server is ready on port '+@server_port


  initTwit: (callback=->) ->
    @twit = new Twit
      consumer_key: 'CsVKGw4s9iuNZS5iBSAsDsg82'
      consumer_secret: 'oEwocQr7u1Ougrv0lZJG2Lp3a6BRdW90dra0mHBwT3sMd0c4Lu'
      access_token: '14946209-66LNceUHlvwBwX1WExZziG9zLaO7wjMlTsvw877vp'
      access_token_secret: 'jC1sS0fz6CMtsbRUGnuGV5Rbrko0r1xxaP0ZnIsykF7oA'
    callback()


  initServer: (callback=->) ->
    @app = express()
    @app.use express.bodyParser()

    # simple log
    @app.use (req, res, next) =>
      console.log "%s %s", req.method, req.url
      next()

    # /twit?q=@techcrunch&result_type=recent&count=30
    @app.use '/twit/search', (req, res, next) =>
      @twit.get 'search/tweets', req.query, (err, data, response) ->
        res.json data

    @app.use '/twit/user', (req, res, next) =>
      @twit.get 'statuses/user_timeline', req.query, (err, data, response) ->
        res.json data


    # mount static
    @app.use express.static @public_path
    
    # Routes
    # redirect all routes to index.html
    @app.use (req, res, next) =>
      res.sendfile 'html/index.html',
        root: @public_path

    # start server
    @server = http.createServer(@app).listen @server_port, ->
      callback()


###
# Exports
###
module.exports = Server