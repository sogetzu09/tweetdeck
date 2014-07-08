module.exports =

  'public':
    options:
      amd: true
      namespace: false
    files: [
      expand: true
      cwd: '<%= vars.public.src %>hbs/'
      src: ['**/*.hbs']
      dest: '<%= vars.public.dest %>js/'
      ext: '.js'
    ]