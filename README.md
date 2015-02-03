# map.lu
This is the sources to my map tiles server which runs on http://map.lu

I use this webapp as a front-end to provide my own customised maps on various sites. The actual map server running mapnik and using a small section of the OpenStreepMap data actually runs on a server at home.

How it works: Simply if a copy of the tile is not available locally then it retrieves the tile from the home server. That tile is then cached permanently on the public server.

Every so often the public cache is cleared, usually if it's getting large or the database has been updated (I only update it once every 6 months or so) or the layer's details have changed.
