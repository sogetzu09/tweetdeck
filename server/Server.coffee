###
# Dependencies
###

_             = require 'lodash'
express       = require 'express'
http          = require 'http'
path          = require 'path'
url           = require 'url'
fs            = require 'fs-extra'


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
    @initServer () =>
      console.log 'Server is ready on port '+@server_port


  initServer: (callback=->) ->
    @app = express()
    @app.use express.bodyParser()

    # simple log
    @app.use (req, res, next) =>
      console.log "%s %s", req.method, req.url
      next()

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