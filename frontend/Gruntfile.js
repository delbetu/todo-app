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
            src: ['**/backbone.js', '**/underscore.js', '**/dist/jquery.js'],
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
          }
        ]
      }
    },
    watch: {
      scripts: {
        files: ['app/**/*'],
        tasks: ['build']
      }
    },
    clean: ['build'],
    concat: {
      dist: {
        src: ['app/scripts/models/**/*.js',
              'app/scripts/collections/**/*.js',
              'app/scripts/views/**/*.js',
              'app/scripts/routers/**/*.js'],
        dest: 'build/scripts/app.js'
      }
    }
  });

  grunt.loadNpmTasks('grunt-contrib-connect');
  grunt.loadNpmTasks('grunt-contrib-jst');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-concat');

  grunt.registerTask('build', ['jst', 'concat', 'copy']);
  grunt.registerTask('default', ['build', 'connect']);
};
