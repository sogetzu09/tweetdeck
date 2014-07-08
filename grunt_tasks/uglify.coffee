module.exports =
  'public':
    options:
      mangle: true
    files: [
      expand: true
      cwd: '<%= vars.public.dest %>'
      src: ['**/*.js']
      dest: '<%= vars.public.dest %>'
      ext: '.js'
    ]