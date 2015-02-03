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
package uk.trainwatch.web.map.cache;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import uk.trainwatch.web.util.CacheControl;
import uk.trainwatch.web.util.ImageUtils;

/**
 * Base servlet for serving images in an {@link ImageCache}
 * <p>
 * @param <K> Key type
 * <p>
 * @author Peter T Mount
 */
public abstract class ImageCacheServlet<K extends ImageCacheKey>
        extends HttpServlet
{

    private final ImageCache<K> cache = new ImageCache<>( getUrlProvider() );

    /**
     * Return the {@link ImageCacheUrlProvider} for this layer
     * <p>
     * @return ImageCacheUrlProvider
     */
    protected abstract ImageCacheUrlProvider<K> getUrlProvider();

    /**
     * Resolve the key for this request.
     * <p>
     * If an error occurs this method should call response.sendError() then return null.
     * <p>
     * @param request  Request
     * @param response Response
     * <p>
     * @return K or null if an error has occurred
     * <p>
     * @throws ServletException on major error
     * @throws IOException      on major error
     */
    protected abstract K getKey( HttpServletRequest request, HttpServletResponse response )
            throws ServletException,
                   IOException;

    @Override
    public void destroy()
    {
        cache.close();
    }

    @Override
    protected final void doGet( HttpServletRequest request, HttpServletResponse response )
            throws ServletException,
                   IOException
    {
        K key = getKey( request, response );
        if( key != null ) {
            try {
                Path path = cache.getTile( key );
                if( path == null ) {
                    // The tile path is invalid
                    response.sendError( HttpServletResponse.SC_NOT_FOUND, request.getPathInfo() + "not found." );
                }
                else {
                    response.setContentType( "image/png" );
                    ImageUtils.sendFile( path, CacheControl.HOUR, response );
                }
            }
            catch( InterruptedException ex ) {
                response.sendError( HttpServletResponse.SC_GATEWAY_TIMEOUT, request.getPathInfo() + "not found." );
            }
        }
    }

}
