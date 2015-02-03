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

import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import uk.trainwatch.web.map.cache.ImageCacheUrlProvider;

/**
 *
 * @author Peter T Mount
 */
final class TileUrlProvider
        implements ImageCacheUrlProvider<TileKey>
{

    private static final String REMOTE_URL = "http://ganymede.retep.org/";

    @Override
    public URLConnection getImageUrl( TileKey key )
            throws IOException
    {
        return new URL( REMOTE_URL + key.getPath() ).openConnection();
    }

}
