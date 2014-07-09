require.config

  deps: [
    'backbone.marionette'
    'bootstrap'
    'init'
  ]

  paths:

    # -- Vendors
    'jquery': '../bower_components/jquery/dist/jquery'
    'underscore': '../bower_components/underscore/underscore'
    
    'backbone': '../bower_components/backbone/backbone'
    'backbone.wreqr': '../bower_components/backbone.wreqr/lib/backbone.wreqr'
    'backbone.marionette': '../bower_components/backbone.marionette/lib/core/amd/backbone.marionette'
    'backbone.localstorage': '../bower_components/backbone.localstorage/backbone.localStorage'
    'backbone.babysitter': '../bower_components/backbone.babysitter/lib/backbone.babysitter'

    'bootstrap': '../bower_components/bootstrap/dist/js/bootstrap'
    'moment': '../bower_components/moment/moment'

  shim:
    'backbone':
      deps: ['underscore','jquery']
      exports: 'Backbone'
    'backbone.marionette':
      deps: ['backbone']
      exports: 'Marionette'
    'bootstrap':
      deps: ['jquery']