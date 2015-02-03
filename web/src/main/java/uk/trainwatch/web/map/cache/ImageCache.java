/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.trainwatch.web.map.cache;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UncheckedIOException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Public API to the image cache.
 * <p/>
 * @author peter
 * @param <K>
 */
public class ImageCache<K extends ImageCacheKey>
{

    private static final Logger LOG = Logger.getLogger( ImageCache.class.getName() );

    private final Lock lock = new ReentrantLock();
    private final Map<K, Condition> conditions = new HashMap<>();
    private final ImageCacheUrlProvider<K> urlProvider;

    private boolean autoRetrieve = true;
    private boolean running = true;

    public ImageCache( ImageCacheUrlProvider<K> urlProvider )
    {
        this.urlProvider = urlProvider;
    }

    public synchronized ImageCache<K> setAutoRetrieve( boolean autoRetrieve )
    {
        this.autoRetrieve = autoRetrieve;
        return this;
    }

    public synchronized boolean isAutoRetrieve()
    {
        return autoRetrieve;
    }

    public void close()
    {
        lock.lock();
        try {
            running = false;

            conditions.values().
                    forEach( Condition::signalAll );
        }
        finally {
            lock.unlock();
        }
    }

    /**
     * Returns the tile for the given path
     * <p/>
     * @param tile Path of the tile, eg layer/z/x/y.png
     * <p/>
     * @return Tile containing the image, null if not found
     * <p>
     * @throws java.lang.InterruptedException
     */
    public Path getTile( K tile )
            throws InterruptedException
    {
        LOG.log( Level.FINER, () -> tile.getKeyPath() );

        lock.tryLock( 2, TimeUnit.SECONDS );
        try {
            final Path path = FileSystems.getDefault().
                    getPath( tile.getKeyPath() );

            // Are we shutting down?
            if( !running ) {
                return null;
            }

            Path ret = cacheEntryExists( path );
            if( ret == null && isAutoRetrieve() ) {
                Condition c = conditions.get( tile );
                if( c == null ) {
                    // No condition so we need to retrieve the tile

                    c = lock.newCondition();
                    conditions.put( tile, c );

                    try {
                        // Render the tile. Must release the lock else only 1 thread can render
                        lock.unlock();
                        render( tile, path );
                    }
                    finally {
                        // Always regain the lock then signal all waiters on this condition
                        lock.lock();
                        c.signalAll();
                        conditions.remove( tile );
                    }
                }
                else {
                    // Await on the condition until the retrieve completes
                    c.await( 10, TimeUnit.SECONDS );
                }
            }

            if( ret == null ) {
                ret = cacheEntryExists( path );
            }

            return ret;
        }
        catch( UncheckedIOException |
               IOException |
               InterruptedException ex ) {
            return null;
        }
        finally {
            lock.unlock();
        }
    }

    private Path cacheEntryExists( Path path )
            throws IOException
    {
        final File f = path.toFile();

        return (f.exists() && f.isFile() && f.canRead()) ? path : null;
    }

    private void render( K tile, Path path )
    {
        try {
            URLConnection connection = urlProvider.getImageUrl( tile );
            LOG.log( Level.INFO, () -> "Retrieving: " + connection.getURL() );

            connection.setDoOutput( true );
            connection.connect();

            try( InputStream is = connection.getInputStream() ) {
                path.getParent().
                        toFile().
                        mkdirs();
                Files.copy( is, path, StandardCopyOption.REPLACE_EXISTING );
            }
        }
        catch( IOException ex ) {
            LOG.log( Level.SEVERE, tile.getKeyPath(), ex );
            throw new UncheckedIOException( ex );
        }
    }
}
