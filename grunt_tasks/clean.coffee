module.exports =
  'server':
    ['<%= vars.server.dest %>']
  'server.dist':
    ['<%= vars.server.dist %>']

  'public':
    ['<%= vars.public.dest %>']
  'public.dist':
    ['<%= vars.public.dist %>']  

  'public.distPRE':
    files: [
      {
        src: [
          '<%= vars.public.dest %>js/**/'
          '<%= vars.public.dest %>js/init.js'
          '!<%= vars.public.dest %>js/config.js'
          '!<%= vars.public.dest %>js/config.min.js'
          '!<%= vars.public.dest %>js/'
        ]
      }
      {
        src: [
          '<%= vars.public.dest %>bower_components/**/'
          '!<%= vars.public.dest %>bower_components/modernizr/'
          '!<%= vars.public.dest %>bower_components/requirejs/'
          '!<%= vars.public.dest %>bower_components/video-js/dist/video-js/video-js.swf'
          '!<%= vars.public.dest %>bower_components/'    
        ]
      }
    ]  