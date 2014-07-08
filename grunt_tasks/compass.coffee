module.exports =
  'public':
    options:
      outputStyle: 'expanded'
      # outputStyle: 'compressed' # COMPRESSION OPTIONS FLAG
      sassDir: '<%= vars.public.src %>scss/'
      cssDir: '<%= vars.public.dest %>css/'