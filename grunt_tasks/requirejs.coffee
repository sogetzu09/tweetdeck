module.exports =
  'public':
    options:
      include: 'config'
      baseUrl: '<%= vars.public.dest %>js/'
      mainConfigFile: '<%= vars.public.dest %>js/config.js'
      out: '<%= vars.public.dest %>js/config.js'
      optimize: 'none' # compression is done by uglify task