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

import static uk.trainwatch.web.map.tiles.TileBounds.getXmax;
import static uk.trainwatch.web.map.tiles.TileBounds.getXmin;
import static uk.trainwatch.web.map.tiles.TileBounds.getYmax;
import static uk.trainwatch.web.map.tiles.TileBounds.getYmin;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Peter T Mount
 */
public enum TileKeyFactory
{

    INSTANCE;

    private static final Pattern PATTERN = Pattern.compile( "[/]?([a-zA-Z0-9]+)/([0-9]+)/([0-9]+)/([0-9]+).([a-z]+)" );
    private static final int IDX_LAYER = 1;
    private static final int IDX_Z = 2;
    private static final int IDX_X = 3;
    private static final int IDX_Y = 4;
    private static final int IDX_TYPE = 5;

    public TileKey createTile( String path )
    {
        try
        {
            Matcher m = PATTERN.matcher( path );
            if( m.matches() )
            {
                int z = Integer.parseInt( m.group( IDX_Z ) );
                int x = Integer.parseInt( m.group( IDX_X ) );
                int y = Integer.parseInt( m.group( IDX_Y ) );

                // Check bounds
                if( z >= 0 && z <= 18
                    && x >= getXmin( z ) && x <= getXmax( z )
                    && y >= getYmin( z ) && y <= getYmax( z ) )

                {
                    return new TileKey( z, x, y, m.group( IDX_LAYER ), m.group( IDX_TYPE ) );
                }
            }
        }
        catch( NumberFormatException |
               NullPointerException ex )
        {
            // Ignore, we'll fail the tile by returning null
        }
        return null;
    }

}
