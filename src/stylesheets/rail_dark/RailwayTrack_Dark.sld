<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>OS VectorMap&#174; District - Backdrop style</Name>
    <UserStyle>
      <Title>RailwayTrack</Title>
      <Abstract>Ordnance Survey. &#169; Crown copyright 2013.</Abstract>
      
      
      <!--  Railway Track  -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Multi Track Railway 1:16,000 to 1:24,986</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Multi Track</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<!--
          <MinScaleDenominator>16000</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>      
-->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#e0cb3b</CssParameter>
              <CssParameter name="stroke-width">0.7</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Name>Multi Track Railway 1:7,560 to 1:16,000</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Multi Track</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<!--
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>16000</MaxScaleDenominator>      
-->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#e0cb3b</CssParameter>
              <CssParameter name="stroke-width">1.05</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>  
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Single Track Railway 1:16,000 to 1:24,986</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Single Track</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<!--
          <MinScaleDenominator>16000</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
-->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#e0cb3b</CssParameter>
              <CssParameter name="stroke-width">0.42</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Name>Single Track Railway  1:7,560 to 1:16,000</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Single Track</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<!--
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>16000</MaxScaleDenominator>
-->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#e0cb3b</CssParameter>
              <CssParameter name="stroke-width">0.63</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>  
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Narrow Gauge Railway</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Narrow Gauge</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
<!--
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>       
-->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#e0cb3b</CssParameter>
              <CssParameter name="stroke-width">0.284</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <LineSymbolizer>
            <Stroke>
              <GraphicStroke>
                <Graphic>
                  <Mark>
                    <WellKnownName>shape://vertline</WellKnownName>
                    <Stroke>
                      <CssParameter name="stroke">#e0cb3b</CssParameter>
                      <CssParameter name="stroke-width">0.425</CssParameter>
                    </Stroke>
                  </Mark>
                  <Size>5</Size>
                </Graphic>
              </GraphicStroke>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
