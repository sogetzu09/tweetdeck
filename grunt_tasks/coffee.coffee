module.exports =
  'server':
    options:
      bare: true
    files: [
      expand: true
      cwd: '<%= vars.server.src %>'
      src: ['**/*.coffee']
      dest: '<%= vars.server.dest %>'
      ext: '.js'
    ]

  'public':
    options:
      bare: true
    files: [
      expand: true
      cwd: '<%= vars.public.src %>coffee/'
      src: ['**/*.coffee']
      dest: '<%= vars.public.dest %>js/'
      ext: '.js'
    ]

  'public.rjs':
    options:
      bare: true
    files: [
      src: '<%= vars.public.src %>rjs/config.coffee'
      dest: '<%= vars.public.dest %>js/config.js'
    ]
