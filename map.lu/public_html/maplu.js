$(document).ready(function () {
    var a="<a></a>",div='<div></div>',span="<span></span>",ul="<ul></ul>",li="<li></li>";
    $('#nav').addClass("navbar navbar-inverse navbar-fixed-top")
            .append($(div)
                    .addClass("container")
                    .append($(div)
                            .addClass("navbar-header")
                            .append($('<button></button>')
                                    .addClass("navbar-toggle collapsed")
                                    .attr({
                                        "type": "button",
                                        "data-toggle": "collapse",
                                        "data-target": "#navbar",
                                        "aria-expanded": "false",
                                        "aria-controls": "navbar"
                                    }).append($(span).addClass("sr-only").append("Toggle navigation"))
                                    .append($(span).addClass("icon-bar"))
                                    .append($(span).addClass("icon-bar"))
                                    .append($(span).addClass("icon-bar"))
                                    )
                            .append($(a).addClass("navbar-brand").attr({'href': '/'}).append("Map.lu"))
                            )
                    .append($(div).attr({id: 'navbar'}).addClass("navbar-collapse collapse")
                            .append($(ul).addClass("nav navbar-nav")
                                    .append($(li).append($(a).attr({"href": '/about.html'}).append("About")))
                                    .append($(li).append($(a).attr({"href": '/uk.html'}).append("UK")))
                                    .append($(li).append($(a).attr({"href": '/world.html'}).append("World")))
                                    )
                            )
                    );

    var map = L.map('mapid').setView([51.505, -0.09], 15);

    var wmsLayer = L.tileLayer('http://geoserver.area51.onl/geoserver/gwc/service/tms/1.0.0/osgb15full@EPSG:900913@png/{z}/{x}/{-y}.png').addTo(map);

});
