$(document).ready(function () {
    var a = "<a></a>", div = '<div></div>', span = "<span></span>", ul = "<ul></ul>", li = "<li></li>";
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

    //if ($('#mapid'))
    {
        var map = L.map('mapid').setView([51.505, -0.09], 15);
        var baseLayers = {}, overlays = {};
        var config;
        var ctrl = L.control.layers().addTo(map);

        var c = $("#baseLayers");
        $.get("layers.json", function (d) {
            config = d;
            $.each(d.baseLayers, function (i, v) {
                v.layer = L.tileLayer(v.tileLayer);
                baseLayers[v.label] = v.layer;
                v.comp = $("<input></input>")
                        .attr({"title": v.description,
                            "type": "checkbox",
                            "value": v.label
                        });
                $("<div></div>")
                        .append(v.comp)
                        .append(v.label)
                        .appendTo(c);
                if(i===0)
                    v.comp.attr({"checked":"checked"});
                ctrl.addBaseLayer(v.layer,v.label);
            });
        });
        console.log(baseLayers);
        //L.control.layers(baseLayers, overlays).addTo(map);
    }
});
