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

import java.io.IOException;
import java.net.URLConnection;

/**
 * A provider of the URL to retrieve
 * <p>
 * @param <K> Type of key
 * <p>
 * @author Peter T Mount
 */
public interface ImageCacheUrlProvider<K extends ImageCacheKey>
{

    URLConnection getImageUrl( K key )
            throws IOException;
}
