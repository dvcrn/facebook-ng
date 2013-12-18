module.exports = function (grunt) {
    grunt.initConfig({
        karma: {
            unit: {
                configFile: 'karma.conf.js'
            }
        },
        uglify: {
            compress: {
                options: {
                    mangle: true,
                    compress: true
                },
                files: {
                    'dist/facebook-ng.min.js': ['src/js/facebook-ng.js']
                }
            },
            beautify: {
                options: {
                    beautify: true
                },
                files: {
                    'dist/facebook-ng.js': ['src/js/facebook-ng.js']
                }
            }
        },
        coffee: {
            compile: {
                files: {
                    'src/js/facebook-ng.js': 'src/coffee/facebook-ng.coffee',
                    'test/js/facebookInitSpec.js': 'test/coffee/facebookInitSpec.coffee',
                    'test/js/tagGenerationSpec.js': 'test/coffee/tagGenerationSpec.coffee'
                }
            }
        }
    });

    // Register tasks.
    grunt.loadNpmTasks('grunt-karma');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-coffee');


    grunt.registerTask('test', 'karma');
    grunt.registerTask('build', ['coffee', 'uglify:compress', 'uglify:beautify'])

    grunt.registerTask('default', 'test');
};