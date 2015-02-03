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
        Map.lu provides interactive maps of the UK &amp; Ireland based on <a href="//openstreetmap.org/">OpenStreepMap</a> data as well as other third party
        data sources. The maps are used on my other sites like <a href="//uktra.in">uktra.in</a> &amp; <a href="//maidstoneweather.com">Maidstone Weather</a>.
    </p>

    <h2>Available Base Maps</h2>

    <div>
        <c:forEach items="osm,land" var="layer">
        <div class="left mappreview">
            <div>
                <div>
                    <img src="/tiles/${layer}/12/2053/1365.png" style="left: -90px; top: -212px;">
                    <img src="/tiles/${layer}/12/2054/1365.png" style="left: 166px; top: -212px;">
                    <img src="/tiles/${layer}/12/2053/1366.png" style="left: -90px; top: 44px;">
                    <img src="/tiles/${layer}/12/2054/1366.png" style="left: 166px; top: 44px;">
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