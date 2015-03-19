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

import static uk.trainwatch.web.map.tiles.TileBounds.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Peter T Mount
 */
public enum TileKeyFactory
{

    /**
     * The old Maknik renderer. This has the OSM database behind it
     */
    MAPNIK
            {
                @Override
                public String getRemoteUrl()
                {
                    return "http://ganymede.retep.org/";
                }

                @Override
                protected TileKey createTile( int z, int x, int y, String layer, String type )
                {
                    return new XYZTileKey( this, z, x, y, layer, type );
//                    if( z >= 0 && z <= 18
//                        && x >= getXmin( z ) && x <= getXmax( z )
//                        && y >= getYmin( z ) && y <= getYmax( z ) ) {
//                        return new XYZTileKey( this, z, x, y, layer, type );
//                    }
//                    else {
//                        return null;
//                    }
                }
            },
    /**
     * The newer Geoserver renderer. Currently has the Ordnance Survey data on it.
     */
    GEOS
            {
                @Override
                public String getRemoteUrl()
                {
                    return "http://ganymede.area51.onl:9080/geoserver/gwc/service/tms/1.0.0/";
                }

                @Override
                protected TileKey createTile( int z, int x, int y, String layer, String type )
                {
                    return new TMSTileKey( this, z, x, y, layer, type );
                }
            };

    /**
     * The cache path, in the format:
     * <p>
     * /server/layer/z/x/y.type
     */
    private static final Pattern PATTERN = Pattern.compile( "[/]?([a-zA-Z0-9:_-]+)/([a-zA-Z0-9:_-]+)/([0-9]+)/([0-9]+)/([0-9]+).([a-z]+)" );
    private static final Pattern OLD_PATTERN = Pattern.compile( "[/]?([a-zA-Z0-9:_-]+)/([0-9]+)/([0-9]+)/([0-9]+).([a-z]+)" );
    private static final int IDX_SERVER = 1;
    private static final int IDX_LAYER = 2;
    private static final int IDX_Z = 3;
    private static final int IDX_X = 4;
    private static final int IDX_Y = 5;
    private static final int IDX_TYPE = 6;

    public abstract String getRemoteUrl();

    protected abstract TileKey createTile( int z, int x, int y, String layer, String type );

    public static TileKey createTile( String path )
    {
        try {
            Matcher m = PATTERN.matcher( path );
            if( m.matches() ) {
                TileKeyFactory factory = TileKeyFactory.valueOf( m.group( IDX_SERVER ).
                        toUpperCase() );

                int z = Integer.parseInt( m.group( IDX_Z ) );
                int x = Integer.parseInt( m.group( IDX_X ) );
                int y = Integer.parseInt( m.group( IDX_Y ) );

                return factory.createTile( z, x, y, m.group( IDX_LAYER ), m.group( IDX_TYPE ) );
            }
            else if( m.matches() ) {
                // Transitional, allow the old paths to mapnik until all sites have migrated
                int z = Integer.parseInt( m.group( IDX_Z - 1 ) );
                int x = Integer.parseInt( m.group( IDX_X - 1 ) );
                int y = Integer.parseInt( m.group( IDX_Y - 1 ) );

                return TileKeyFactory.MAPNIK.createTile( z, x, y, m.group( IDX_LAYER - 1 ), m.group( IDX_TYPE - 1 ) );
            }
        }
        catch( IllegalArgumentException |
               NullPointerException ex ) {
            // Ignore, we'll fail the tile by returning null
        }
        return null;
    }

}
