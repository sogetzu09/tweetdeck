module.exports = (grunt) ->

  path = require 'path'
  require('load-grunt-config') grunt,
    configPath: path.join __dirname, '/grunt_tasks'