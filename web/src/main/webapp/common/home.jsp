<%-- 
    Document   : home
    Created on : 21-Jan-2015, 15:10:15
    Author     : peter
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<article>
    <h1>Welcome to Map.lu</h1>
    <p>
        Map.lu provides interactive maps of the UK &amp; Ireland based on openly available data sets from <a href="//openstreetmap.org/">OpenStreepMap</a>, <a href="//www.ordnancesurvey.co.uk/">Ordnance Survey</a> and others.
        The maps are used on my other sites like <a href="//uktra.in/">uktra.in</a> &amp; <a href="//maidstoneweather.com/">Maidstone Weather</a>.
    </p>

    <h2>Ordnance Survey based Maps</h2>

    <div>
        <c:forEach items="rail_dark,osgb,landcover" var="layer">
            <div class="left mappreview">
                <div>
                    <div>
                        <img src="/tiles/geos/${layer}/10/513/683.png" style="left: -65px; top: -102px;">
                        <img src="/tiles/geos/${layer}/10/514/683.png" style="left: 191px; top: -102px;">
                        <img src="/tiles/geos/${layer}/10/513/682.png" style="left: -65px; top: 154px;">
                        <img src="/tiles/geos/${layer}/10/514/682.png" style="left: 191px; top: 154px;">
                    </div>
                </div>
                <p>
                    <c:choose>
                        <c:when test="${layer eq 'rail_dark'}">Railway Dark</c:when>
                        <c:when test="${layer eq 'osgb'}">OSGB Vector</c:when>
                        <c:when test="${layer eq 'landcover'}">OSGB Land Cover</c:when>
                    </c:choose>
                </p>
            </div>
        </c:forEach>
    </div>
    
    <h2>OpenStreetMap based Maps</h2>

    <div>
        <c:forEach items="osm,land" var="layer">
            <div class="left mappreview">
                <div>
                    <div>
                    <img src="/tiles/mapnik/${layer}/12/2053/1365.png" style="left: -90px; top: -212px;">
                    <img src="/tiles/mapnik/${layer}/12/2054/1365.png" style="left: 166px; top: -212px;">
                    <img src="/tiles/mapnik/${layer}/12/2053/1366.png" style="left: -90px; top: 44px;">
                    <img src="/tiles/mapnik/${layer}/12/2054/1366.png" style="left: 166px; top: 44px;">
                    </div>
                </div>
                <p>
                    <c:choose>
                    <c:when test="${layer eq 'osm'}">Open Street Map</c:when>
                    <c:when test="${layer eq 'land'}">Land Cover</c:when>
                    </c:choose>
                </p>
            </div>
        </c:forEach>
    </div>
    
    <div class="clear"></div>

    <p class="note">
        Note: The interactive maps require Javascript to be enabled but that's it. No other plugins are needed. Where possible maps will be mobile friendly.
        Static maps use HTML5 so only an up to date browser is required.
    </p>

</article>