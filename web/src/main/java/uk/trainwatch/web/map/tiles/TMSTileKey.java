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
 * A Tile in TMS format, i.e. Geoserver
 * <p>
 * @author Peter T Mount
 */
public final class TMSTileKey
        extends TileKey
{

    private static final String NORMALIZE_PATH = "%1$s@EPSG:900913@%5$s/%2$d/%3$d/%4$d.%5$s";
    private static final String CACHE_PATH = "/usr/local/maps/%s/%d/%d/%d.%s";

    public TMSTileKey( TileKeyFactory factory, int z, int x, int y, String layer, String type )
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
