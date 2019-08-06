# Tag railway

Notes on the [Railway tag](https://wiki.openstreetmap.org/wiki/Map_Features#Railway)

## Tag values

These are the values for the railway tag:

| value | content |
| --- | --- |
| abandoned |  The course of a former railway which has been abandoned and the track and infrastucture removed. The course may be still recognized through embankments, cuttings, bridges, tunnel and rolling or straight ways.
| construction | Railway under construction.
| disused | A section of railway which is no longer used but where the track and infrastructure remains in place. See disused:railway=* for alternative tagging.
| funicular | Cable driven inclined railways on a steep slope, with a pair of cars connected by one cable
| light_rail | A higher-standard tram system, normally in its own right-of-way. Often it connects towns and thus reaches a considerable length (tens of kilometers).
| miniature | Miniature railways are narrower than narrow gauge and carry passengers, frequently at an exact scale of "standard-sized" rail (for example "1/4 scale"). They can often be found in parks.
| monorail | A railway with only a single rail. A monorail can run above the rail like in Las Vegas and Disneyland or can suspend below the rail like the Wuppertal Schwebebahn (Germany).
| narrow_gauge | Narrow-gauge passenger or freight trains. Narrow gauge railways can have mainline railway service like the Rhaetian Railway in Switzerland or can be a small light industrial railway. Use gauge=* to specify the actual width of rails in mm.
| proposed | A proposed railway (see below)
| preserved | A railway running historic trains, usually a tourist attraction (changed to preserved from preserved_rail as "rail" is redundant). Using railway:preserved=yes is an alternate method to mark railway as preserved.
| rail | Full sized passenger or freight trains in the standard gauge for the country or state.
| subway | A city passenger rail service running mostly grade separated (see Wikipedia:rapid transit). Often a significant portion of the line or its system/network is underground.
| tram | One or two carriage rail vehicles, usually sharing motor road, sometimes called "street running" (Other languages).

* railway=proposed also has proposed= which defines the type, rail, subway, light-rail etc
* railway=construction also as construction= with the type
* railway=dismantled or railway=razed is not always used but is where the line no longer exists, built upon etc.

## Additional features

| key | value | content |
| --- | --- | --- |
| bridge | yes | If the railway goes over a street, waterway or other railway on an elevated structure.
| cutting | yes | A section where the railway is significantly lower than ground level, but not underground.
| electrified | contact_line| a power line over the train head
|  | rail | a third rail near the track supplying the train with power
|  | yes | electrified track, but no details available
|  | no | track with no power supply.
| embankment | yes | A section where the railway is raised significantly higher than ground level
| embedded_rails | yes / *type_of_railway* |  Specifies that a highway on which non-railway traffic is also allowed has railway tracks embedded in it but the rails are mapped as separate ways.
| frequency | *number* [Hz] | The frequency with which a line is electrified. Use 0 for DC. Also see the voltage tag.
| railway:track_ref | *number* | Track number
| service | crossover | Relatively short lengths of track which switch traffic from one parallel line to another
| | siding | Relatively short lengths of track, running parallel to (and connected to) a main route
| | spur | Relatively short lengths of track, built to give one company or entity access to a main or branch line.
| | yard | Tracks within railway company operated marshaling or maintenance yards.
| tracks | *number* | Number of parallel tracks in close proximity when mapped as one single way representing all tracks. If not given means unknown and defaults to 1. In many parts of the world the tracks are being drawn out separately so that there is more detail, in which case this tag isn't used.
| tunnel | yes | If the railway goes below ground. Most subways have this tag
| usage | main | main line - heavy traffic
| | branch | branch line - connecting places with a mainline
| | freight | freight service only
| | industrial | servicing large plants (iron, chemical etc.), surface mining, …
| | military | servicing military area 
| | tourism | most mountain rails (rack-rails, funicular) and preserved railways.
| voltage | *number* | The voltage with which a line is electrified. Also see the frequency tag.

## Stations & Stops

| key | value | content |
| --- | --- | --- |
| railway | halt | 	A small station without switches
| public_transport | stop_position | The position on the railway track where the train (its center) stops at a platform. This is useful for routing on long platforms where also short trains stop and on long platforms where multiple trains stop behind each other. See also public_transport=stop_area.
| | platform | This is parallel to the rail line for showing where the actual platforms are. It is also to know where you can change platform and enter the station, so use footpaths to connect them. This is really useful for routing too. Use only if the platform is served by public transport.
| | station | Railway passenger only station.
| railway | platform | This is parallel to the rail line for showing where the actual platforms are. It is also to know where you can change platform and enter the station, so use footpaths to connect them. This is really useful for routing too. Use in addition to public_transport=platform.
| | station | Railway passenger and/or cargo station. Use in addition to public_transport=station.
| | subway_entrance | The entrance to a subway station, usually going from surface to underground.
| | tram_stop | A tram stop is a place where a passenger can embark / disembark a tram.

## Other railways

| key | value | content |
| --- | --- | --- |
| railway | buffer_stop | stops the train at the end of a track. see Buffer_stop.
| | derail | a device used to prevent fouling of a rail track by unauthorized movements of trains or unattended rolling stock. See Derail_(railroad).
| | crossing | A point where pedestrians may cross.
| | level_crossing | A point where rails and roads cross.
| | signal | Any kind of railway signal
| | switch | Full Connections between railways (aka 'points').
| | railway_crossing | Crossing rails with no interconnection.
| | roundhouse | A semicircular building with many stalls for servicing engines.
| | traverser | These are used for changing trains between railways. Also known as transfer table.
| | turntable | These are used for changing the direction that part of a train is pointing in.
| | wash | A Railroad car wash
| landuse | railway | Ground used around railways and railway-stations.

See also [taginfo](https://taginfo.openstreetmap.org/keys/railway#values) for other values

## Table notes

When `railway is not null`

### planet_osm_line

| railway | column | comment | example |
| --- | --- | --- | --- |
| rail | name | Name of line | "Maidstone East Line" or "Maidstone Line"
| rail | operator | Mostly null, Sometimes tagged with operator | "Network Rail"
| miniature | name | Name of railway | "Maidstone Model Railway"


### planet_osm_polygon

| railway | column | comment | example |
| --- | --- | --- | --- |
| platform | name | Platform number | 1
| | ref | Seems to match platform number
| signal_box | name | Signal box name | Saint Erth Signal Box
| station | name | Station name | Penzance


### planet_osm_roads

| railway | column | comment | example |
| --- | --- | --- | --- |