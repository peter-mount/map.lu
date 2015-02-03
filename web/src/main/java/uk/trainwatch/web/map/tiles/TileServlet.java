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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.trainwatch.web.map.cache.ImageCacheServlet;
import uk.trainwatch.web.map.cache.ImageCacheUrlProvider;

/**
 *
 * @author Peter T Mount
 */
@WebServlet( name = "TileServlet", urlPatterns = "/tiles/*" )
public class TileServlet
        extends ImageCacheServlet<TileKey>
{

    @Override
    protected ImageCacheUrlProvider<TileKey> getUrlProvider()
    {
        return new TileUrlProvider();
    }

    @Override
    protected TileKey getKey( HttpServletRequest request, HttpServletResponse response )
            throws ServletException,
                   IOException
    {
        TileKey tile = TileKeyFactory.INSTANCE.createTile( request.getPathInfo() );

        if( tile == null )
        {
            // The tile path is invalid
            //response.sendError( HttpServletResponse.SC_NOT_FOUND, request.getPathInfo() + " not found." );
        }
        
        return tile;
    }

}
