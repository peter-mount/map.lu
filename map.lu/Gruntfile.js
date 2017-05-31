module.exports = function (grunt) {
    // Project configuration.
    grunt.initConfig({
        copy: {
            main: {
                files: [
                    {
                        expand: true,
                        cwd: "public_html",
                        src: "js/leaflet*",
                        dest: "dist/"
                    },
                    {
                        expand: true,
                        cwd: "public_html",
                        src: "css/leaflet*",
                        dest: "dist/"
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
                    "dist/maplu-min.css": [
                        "public_html/css/bootstrap.min.css",
                        "public_html/css/leaflet.css",
                        "public_html/css/maplu.css"
                    ],
                    "dist/css/leaflet-min.css": [
                        "public_html/css/leaflet.css"
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
            },
            leaflet: {
                src: "dist/js/leaflet.js",
                dest: "dist/js/leaflet-min.js"
            },
            leaflethash: {
                src: "dist/js/leaflet-hash.js",
                dest: "dist/js/leaflet-hash-min.js"
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
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-htmlmin');
    grunt.loadNpmTasks('grunt-processhtml');

    grunt.registerTask('build', ['copy','cssmin', 'concat', 'uglify', 'processhtml', 'htmlmin']);
};
