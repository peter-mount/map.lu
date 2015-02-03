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
/**
 * The default tile server proxy.
 * 
 * This will serve locally cached tiles, retrieving them from my home map server if they are not present.
 * 
 * Note: This package requires IPv6 to work as the private map server is only accessible on the metric Internet.
 */
package uk.trainwatch.web.map.tiles;
