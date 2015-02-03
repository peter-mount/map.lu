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
package uk.trainwatch.web.map;

import uk.trainwatch.web.servlet.AbstractHomeServlet;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

/**
 *
 * @author Peter T Mount
 */
@WebServlet(name = "StaticServlet",
            urlPatterns = {
                // The uri's to map
                "/whatsnew",
                "/map",
                "/terms"
            },
            initParams = {
                // The uri -> tile mapping
                @WebInitParam(name = "/whatsnew", value = "whatsnew"),
                @WebInitParam(name = "/map", value = "map"),
                @WebInitParam(name = "/terms", value = "terms")
            })
public class StaticServlet
        extends AbstractHomeServlet
{

}
