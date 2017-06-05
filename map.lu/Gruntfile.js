module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        clean: [
            'temp/*',
            'dist/*'
        ],
        copy: {
            main: {
                files: [
                    {
                        expand: true,
                        cwd: "public_html",
                        src: "**/*.html",
                        dest: "temp/"
                    },
                    // Images
                    {
                        expand: true,
                        cwd: 'public_html',
                        src: '**/*.png',
                        dest: 'dist/'
                    }
                ]
            }
        },
        cssmin: {
            options: {
                shorthandCompacting: false,
                roundingPrecision: -1
            },
            target: {
                files: {
                    "dist/css/maplu.min.css": [
                        "public_html/css/maplu.css"
                    ]
                }
            }
        },
        concat: {
            dist: {
                src: [
                    "public_html/js/maplu.js",
                    "public_html/js/maps.js",
                    "public_html/js/groupcontrol.js",
                    "public_html/js/layers.js"
                ],
                dest: "temp/js/maplu.js"
            }
        },
        uglify: {
            maplu: {
                src: "temp/js/maplu.js",
                dest: "dist/js/maplu.min.js"
            }
        },
        dom_munger: {
            build: {
                options: {
                    callback: function ($, file) {
                        require('./dom-parser')($, file, grunt);
                    }
                },
                src: "temp/**/*.html"
            }
        },
        htmlmin: {
            dist: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: [{
                        expand: true,
                        cwd: 'temp',
                        src: '**/*.html',
                        dest: 'dist'
                    }]
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-htmlmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-dom-munger');
    grunt.loadNpmTasks('grunt-newer');
    //grunt.loadNpmTasks('grunt-processhtml');

    grunt.registerTask('build', [
        //'clean',
        'copy',
        'cssmin',
        'concat',
        'uglify',
        'dom_munger',
        'htmlmin'
    ]);
};
