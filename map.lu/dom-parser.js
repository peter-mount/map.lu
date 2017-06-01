
var path = require('path');
var grunt;
module.exports = function ($, file, g) {
    grunt = g;

    // Only add nav's if we want them
    if (!$('html').attr('data-excludenavs'))
        area51_general_layout($);
    else
        $('html').removeAttr('data-excludenavs');

    templates($, file);
    conditionals($, file);
};

/*
 * Handles the standard Area51 page layout
 */
function area51_general_layout($) {
    $('head')
            .prepend(grunt.file.read('template/head.htm'));

    $('body')
            .prepend(grunt.file.read('template/nav.htm'))
            .append(grunt.file.read('template/footer.htm'))
            .append(grunt.file.read('template/auth.htm'));

    // Set nav element's css class
    $('nav').addClass('navbar navbar-default');

    // Wrap content in body with a div/article, keeping nav, breadcrumbs & footer in correct places
    // article is used if no article element exists, otherwise it's a div
    var b = $('body'),
            nav = $('nav').remove(),
            modal = $('.modal').remove(),
            brd = $('.breadcrumb').remove(),
            ftr = $('#footer').remove();

    // Body div, move breadcrumbs into this
    var d = $('<div></div>')
            .attr({id: 'body'});
    if (brd.length)
        d.addClass('bodyBreadcrumb');

    // Body inner div for content
    var di = $('<div></div>')
            .attr({id: 'body-inner'});
    d.append(di);

    // article - if none then wrap all content with one
    var a = di;
    if ($('article').length === 0) {
        a = $('<article></article>');
        di.append(a);
    }
    a.append(b.contents());

    // Rebuild the body so we have brd,div,footer,nav,modal
    b.empty()
            .append(brd)
            .append(d)
            .append(ftr)
            .append(nav)
            .append(modal);
}

/*
 * Conditional blocks
 * 
 * Add class on-page to keep the element if on a page. off-page to do the
 * opposite.
 * 
 * Use the data-path attribute to include the page name to test against.
 * 
 * As of 7 Apr 2017 data-path can be csv list of paths & if ending in * taken as a glob
 */
function conditionals($, file) {

    // Strip of top directory name
    var filename = '/' + file.split('/').splice(1).join('/');

    /*
     * s = class to check, f true to keep, false to remove if on that page
     */
    var task = function (s, f) {
        $('.' + s).each(function (i, v) {
            var d = $(v);

            if (test(f, d.attr('data-path'), filename))
                d.remove();
            else
                d.removeClass(s);
        });
    };

    task('on-page', true);
    task('off-page', false);
}
function test(f, p, filename) {
    if (!p)
        return false;

    return p.split(',')
            .map(function (v) {
                return v ? v.trim() : '';
            })
            .filter(function (v) {
                return v ? v.length > 0 : false;
            })
            .reduce(function (a, path) {
                if (a)
                    return a;

                // glob
                if (path.endsWith('*'))
                    path = filename.startsWith(path.substr(0, path.length - 1));
                else
                    // equality
                    path = path === filename;

                // Test fill fileName
                return (f && !path) || (!f && path);

            }, false);
}

/*
 * Handles templates.
 * 
 * Template is an empty script with attribute ng-src pointing to a relative file
 */
function templates($, file) {
    $('script[ng-src]').each(function (idx, div) {
        div = $(div);
        var temp = path.join(path.dirname(grunt.file.expand(file)), div.attr('ng-src'));
        div.replaceWith(grunt.file.read(temp));
    });
}
