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
    },
    copy: {
      main: {
        files: [
          {
            nonull: true,
            expand: true,
            flatten: true,
            cwd: 'node_modules/',
            src: ['**/backbone.js', '**/underscore.js', '**/jquery.js'],
            dest: 'build/vendor/'
          },
          {
            nonull: true,
            expand: true,
            cwd: 'node_modules/',
            src: ['todomvc-app-css/*.css'],
            dest: 'build/vendor'
          }
        ]
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-jst');
  grunt.loadNpmTasks('grunt-contrib-copy');

  grunt.registerTask('build', ['jst', 'copy']);
  grunt.registerTask('default', ['build', 'connect']);
};
