module.exports =
  'public':
    # options:
    #   mangle: true
    files: [
      expand: true
      cwd: '<%= vars.public.dest %>'
      src: ['**/*.css']
      dest: '<%= vars.public.dest %>'
      ext: '.css'
    ]