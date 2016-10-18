module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        cssmin: {
            options: {
                shorthandCompacting: false,
                roundingPrecision: -1
            },
            target: {
                files: {
                    "dist/maplu-min.css": [
                        "public_html/css/bootstrap.min.css",
                        "public_html/css/leaflet.css",
                        "public_html/css/maplu.css"
                    ]
                }
            }
        },
        concat: {
            dist: {
                src: [
                    "public_html/js/jquery-3.1.1.min.js",
                    "public_html/js/bootstrap.min.js",
                    "public_html/js/leaflet.js",
                    "public_html/js/leaflet-hash.js",
                    "public_html/js/maps.js",
                    "public_html/js/layers.js",
                    "public_html/js/maplu.js"
                ],
                dest: "dist/maplu.js"
            }
        },
        uglify: {
            mobile: {
                src: "dist/maplu.js",
                dest: "dist/maplu-min.js"
            }
        },
        processhtml: {
            build: {
                files: {
                    "dist/index.html": "public_html/index.html"
                }
            }
        },
        htmlmin: {
            dist: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: {
                    "dist/index.html": "dist/index.html"
                }
            }
        }
    });

    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-htmlmin');
    grunt.loadNpmTasks('grunt-processhtml');

    grunt.registerTask('build', ['cssmin', 'concat', 'uglify', 'processhtml', 'htmlmin']);
};
