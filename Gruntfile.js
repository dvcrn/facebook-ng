module.exports = function(grunt) {
  grunt.initConfig({
    karma: {
        unit: {
            configFile: 'karma.conf.js'
        }
    }
  });

  // Register tasks.
  grunt.loadNpmTasks('grunt-karma');

  // Default task.
  grunt.registerTask('test', 'karma');
  grunt.registerTask('default', 'test');
};