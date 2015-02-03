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

import java.util.Objects;
import uk.trainwatch.web.map.cache.ImageCacheKey;

/**
 *
 * @author Peter T Mount
 */
public final class TileKey
        implements ImageCacheKey
{

    private static final String NORMALIZE_PATH = "%s/%d/%d/%d.%s";
    private static final String CACHE_PATH = "/usr/local/maps/" + NORMALIZE_PATH;

    private final int z;
    private final int x;
    private final int y;
    private final String layer;
    private final String type;
    private final int hashCode;

    public TileKey( int z, int x, int y, String layer, String type )
    {
        this.z = z;
        this.x = x;
        this.y = y;
        this.layer = layer;
        this.type = type;

        int hash = 5;
        hash = 83 * hash + this.z;
        hash = 83 * hash + this.x;
        hash = 83 * hash + this.y;
        hash = 83 * hash + Objects.hashCode( this.layer );
        hashCode = 83 * hash + Objects.hashCode( this.type );
    }

    public String getPath()
    {
        return String.format( NORMALIZE_PATH, layer, z, x, y, type );
    }

    @Override
    public String getKeyPath()
    {
        return String.format( CACHE_PATH, layer, z, x, y, type );
    }

    @Override
    public int hashCode()
    {
        return hashCode;
    }

    @Override
    public boolean equals( Object obj )
    {
        if( obj == null || getClass() != obj.getClass() )
        {
            return false;
        }
        final TileKey other = (TileKey) obj;
        return this.z == other.z
               && this.x == other.x
               && this.y == other.y
               && Objects.equals( this.layer, other.layer )
               && Objects.equals( this.type, other.type );
    }

}
