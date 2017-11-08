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
                    },
                    {
                        expand: true,
                        cwd: 'public_html',
                        src: '**/*.svg',
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
                      "public_html/css/maplu.css",
                      "public_html/css/leaflet.draw.css"
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
                  "public_html/js/leaflet-hash.js",
                  "public_html/js/layers.js"
              ],
              dest: "temp/js/maplu.js"
          },
          editor: {
              src: [
                //"public_html/js/leaflet.js",
                //"public_html/js/draw/libs/leaflet-src.js",
                "public_html/js/draw/Leaflet.draw.js",
                "public_html/js/draw/Leaflet.Draw.Event.js",
                // Leaflet Draw Editor
                "public_html/js/draw/Toolbar.js",
                "public_html/js/draw/Tooltip.js",
                "public_html/js/draw/ext/GeometryUtil.js",
                "public_html/js/draw/ext/LatLngUtil.js",
                "public_html/js/draw/ext/LineUtil.Intersect.js",
                "public_html/js/draw/ext/Polygon.Intersect.js",
                "public_html/js/draw/ext/Polyline.Intersect.js",
                "public_html/js/draw/ext/TouchEvents.js",
                "public_html/js/draw/draw/DrawToolbar.js",
                "public_html/js/draw/draw/handler/Draw.Feature.js",
                "public_html/js/draw/draw/handler/Draw.SimpleShape.js",
                "public_html/js/draw/draw/handler/Draw.Polyline.js",
                "public_html/js/draw/draw/handler/Draw.Marker.js",
                "public_html/js/draw/draw/handler/Draw.Circle.js",
                "public_html/js/draw/draw/handler/Draw.CircleMarker.js",
                "public_html/js/draw/draw/handler/Draw.Polygon.js",
                "public_html/js/draw/draw/handler/Draw.Rectangle.js",
                "public_html/js/draw/edit/EditToolbar.js",
                "public_html/js/draw/edit/handler/EditToolbar.Edit.js",
                "public_html/js/draw/edit/handler/EditToolbar.Delete.js",
                "public_html/js/draw/Control.Draw.js",
                "public_html/js/draw/edit/handler/Edit.Poly.js",
                "public_html/js/draw/edit/handler/Edit.SimpleShape.js",
                "public_html/js/draw/edit/handler/Edit.Rectangle.js",
                "public_html/js/draw/edit/handler/Edit.Marker.js",
                "public_html/js/draw/edit/handler/Edit.CircleMarker.js",
                "public_html/js/draw/edit/handler/Edit.Circle.js",
                //
                "public_html/js/editor/main.js",
                "public_html/js/editor/layertypes.js",
                "public_html/js/editor/controls.js",
                "public_html/js/maps.js",
                "public_html/js/groupcontrol.js",
                "public_html/js/leaflet-hash.js",
                "public_html/js/layers.js",
                "public_html/js/editor/editor.js"
              ],
              dest: "dist/js/editor.js"
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
