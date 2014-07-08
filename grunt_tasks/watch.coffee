module.exports =

  # SERVER
  'coffee.server':
    files: [
      '<%= vars.server.src %>**/*.coffee'
    ]
    tasks: [
      'newer:coffee:server'
    ]
    
  'express':
    files: [
      '<%= vars.server.dest %>**/*.js'
    ]
    tasks: [
      'express:server'
    ]
    options: 
      spawn: false


  # PUBLIC
  'coffee.public':
    files: [
      '<%= vars.public.src %>coffee/**/*.coffee'
      '<%= vars.public.src %>rjs/**/*.coffee'
    ]
    tasks: [
      'newer:coffee:public'
      'newer:coffee:public.rjs'
    ]

  'copy.public':
    files: [
      '<%= vars.public.src %>img/**/*'
      '<%= vars.public.src %>fonts/**/*'
      '<%= vars.public.src %>html/**/*'
      '<%= vars.public.src %>json/**/*'
    ]
    tasks: [
      'newer:copy:public'
      'newer:copy:public.html'
    ]
    

  'handlebars':
    files: [
      '<%= vars.public.src %>hbs/**/*.hbs'
    ]
    tasks: [
      'newer:handlebars:public'
    ]

  'jst':
    files: [
      '<%= vars.public.src %>jst/**/*.jst'
    ]
    tasks: [
      'newer:jst:public'
    ]

  'yaml':
    files: [
      '<%= vars.public.src %>yaml/**/*.yaml'
    ]
    tasks: [
      'newer:yaml:public'
    ]

  'compass':
    files: [
      '<%= vars.public.src %>scss/**/*.scss'
      '<%= vars.public.src %>scss/**/*.css'
      '<%= vars.public.src %>fonts/fontello/**/*.css' # Fontello specific
    ]
    tasks: [
      'compass:public'
    ]

  'sprite':
    files: [
      '<%= vars.public.src %>sprite2x/**/*'
    ]
    tasks: [
      'sprite:public'
      'compass:public'
    ]
  