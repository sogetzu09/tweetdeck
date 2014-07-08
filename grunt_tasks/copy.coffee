module.exports =
  'public':
    expand: true
    cwd: '<%= vars.public.src %>'
    src: [
      'img/**'
      'fonts/**'
      'video/**'
      'html/**'
    ]
    dest: '<%= vars.public.dest %>'

  # 'public.html':
  #   expand: true
  #   cwd: '<%= vars.public.src %>html/'
  #   src: [
  #     '**'
  #   ]
  #   dest: '<%= vars.public.dest %>'

  'public.bower':
    expand: true
    cwd: '<%= vars.public.src %>bower_components/'
    src: [
      '**/*.js'
      '**/*.swf'
    ]
    dest: '<%= vars.public.dest %>bower_components/'

  'public.dist':
    expand: true
    cwd: '<%= vars.public.dest %>'
    src: [
      '**'
    ]
    dest: '<%= vars.public.dist %>'

  'server.dist':
    expand: true
    cwd: '<%= vars.server.dest %>'
    src: [
      '**'
    ]
    dest: '<%= vars.server.dist %>'


