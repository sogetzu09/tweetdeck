module.exports =
  'server':
    options:
      port: '8080'
      args: [
        'dev'
      ]
      script: '<%= vars.server.dest %>app.js'