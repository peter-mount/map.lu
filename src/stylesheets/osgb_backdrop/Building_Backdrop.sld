<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>OS VectorMap&#174; District - Backdrop style</Name>
    <UserStyle>
      <Title>Building</Title>
      <Abstract>Ordnance Survey. &#169; Crown copyright 2013.</Abstract>
      
      
      <!-- Building polygons -->       
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Building outline from 1:20,000</Name>
          <MinScaleDenominator>20000</MinScaleDenominator>
          <!--MaxScaleDenominator>20000</MaxScaleDenominator-->       
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FF3300</CssParameter>
              <CssParameter name="stroke-width">0.108</CssParameter>
            </Stroke>
          </LineSymbolizer>       
        </Rule>
        <Rule>
          <Name>Building polygon 1:7,560 TO 1:24,986</Name>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>        
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#FF3300</CssParameter>
            </Fill>
          </PolygonSymbolizer>
        </Rule>
        <Rule>
          <Name>Building outline 1:17,500 to 1:20,000</Name>
          <MinScaleDenominator>17500</MinScaleDenominator>
          <MaxScaleDenominator>20000</MaxScaleDenominator>       
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FF3300</CssParameter>
              <CssParameter name="stroke-width">0.108</CssParameter>
            </Stroke>
          </LineSymbolizer>       
        </Rule>
        <Rule>
          <Name>Building outline 1:7,560 to 1:17,500</Name>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>16000</MaxScaleDenominator>       
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FF3300</CssParameter>
              <CssParameter name="stroke-width">0.162</CssParameter>
            </Stroke>
          </LineSymbolizer>       
        </Rule>  
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
