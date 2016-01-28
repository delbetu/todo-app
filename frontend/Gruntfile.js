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
        files: {
          "build/templates/templates.js": ["app/templates/**/*.html.jst"]
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
          },
          {
            nonull: true,
            expand: true,
            flatten: true,
            src: ['app/index.html'],
            dest: 'build/'
          },
          {
            nonull: true,
            expand: true,
            flatten: true,
            src: ['app/scripts/app.js'],
            dest: 'build/scripts'
          }
        ]
      }
    },
    watch: {
      scripts: {
        files: ['app/**/*'],
        tasks: ['build']
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-jst');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('build', ['jst', 'copy']);
  grunt.registerTask('default', ['build', 'connect']);
};
