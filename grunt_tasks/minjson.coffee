module.exports =
  build:
    files: [
      expand: true
      cwd: '<%= vars.paths.build %>'
      src: ['**/*.json']
      dest: '<%= vars.paths.build %>'
      ext: '.json'
    ]