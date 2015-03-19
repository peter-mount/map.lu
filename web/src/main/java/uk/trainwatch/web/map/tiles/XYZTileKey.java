/*
 * Copyright 2014 Peter T Mount.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package uk.trainwatch.web.map.tiles;

/**
 * A Tile in XYZ format, i.e. Google Maps, OpenStreetMap etc
 * <p>
 * @author Peter T Mount
 */
public final class XYZTileKey
        extends TileKey
{

    private static final String NORMALIZE_PATH = "%s/%d/%d/%d.%s";
    private static final String CACHE_PATH = "/usr/local/maps/" + NORMALIZE_PATH;

    public XYZTileKey( TileKeyFactory factory, int z, int x, int y, String layer, String type )
    {
        super( factory, z, x, y, layer, type );
    }

    @Override
    protected String getNormalizePath()
    {
        return NORMALIZE_PATH;
    }

    @Override
    protected String getCachePath()
    {
        return CACHE_PATH;
    }

}
