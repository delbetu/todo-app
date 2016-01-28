module.exports = function(grunt) {
  grunt.initConfig({
    connect: {
      server: {
        options: {
          keepalive: true,
          base: 'build'
        }
      }
    },
    jst: {
      compile: {
        options: {},
        files: {
          "build/templates/templates.js": ["app/templates/**/*.html.jst", "app/*.html.jst"]
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-jst');

  grunt.registerTask('build', ['jst']);
  grunt.registerTask('default', ['build', 'connect']);
};
