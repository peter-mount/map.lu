<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>OS VectorMap&#174; District - Backdrop style</Name>
    <UserStyle>
      <Title>Land</Title>
      <Abstract>Ordnance Survey. &#169; Crown copyright 2013.</Abstract>
      
      <!-- Land Area polygons -->       
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Land Fill 1:7,560 TO 1:24,986</Name>
          <!--
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
        -->
          <PolygonSymbolizer>
            <Fill>
              <CssParameter name="fill">#66ff66</CssParameter>
              <!--
              <CssParameter name="fill">#FAF9F7</CssParameter>
-->
            </Fill>
          </PolygonSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
