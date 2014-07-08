module.exports =

  'public':
    options:
      amd: true
      namespace: false
      # prettify: true
    files: [
      expand: true
      cwd: '<%= vars.public.src %>jst/'
      src: ['**/*.jst']
      dest: '<%= vars.public.dest %>js/'
      ext: '.js'
    ]