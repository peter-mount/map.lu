<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>OS VectorMap&#174; District - Backdrop style</Name>
    <UserStyle>
      <Title>Roundabout</Title>
      <Abstract>Ordnance Survey. &#169; Crown copyright 2013.</Abstract>
      
      
      <!-- Roundabouts --> 
      
      
      <!--  Local Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Local Road Fill</Name>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Local Street</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Private Road Publicly Accessible</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FCFCFC</CssParameter>
                </Fill>
              </Mark>
              <Size>35.958</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#969696</CssParameter>
                </Fill>
              </Mark>
              <Size>9.598</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FAF9F7</CssParameter>
                </Fill>
              </Mark>
              <Size>7.693</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      
      <!--  Minor Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Minor Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Minor Road</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FFF4E1</CssParameter>
                </Fill>
              </Mark>
              <Size>35.958</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#969696</CssParameter>
                </Fill>
              </Mark>
              <Size>9.598</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FAF9F7</CssParameter>
                </Fill>
              </Mark>
              <Size>7.693</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      
      <!--  B Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>B Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>B Road</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FDD3B1</CssParameter>
                </Fill>
              </Mark>
              <Size>35.958</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#969696</CssParameter>
                </Fill>
              </Mark>
              <Size>9.598</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FAF9F7</CssParameter>
                </Fill>
              </Mark>
              <Size>7.693</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  A Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>A Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>A Road</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FFBBD2</CssParameter>
                </Fill>
              </Mark>
              <Size>35.958</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#969696</CssParameter>
                </Fill>
              </Mark>
              <Size>9.598</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FAF9F7</CssParameter>
                </Fill>
              </Mark>
              <Size>7.693</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Primary Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Primary Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Primary Road</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#A3D2A9</CssParameter>
                </Fill>
              </Mark>
              <Size>35.958</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#969696</CssParameter>
                </Fill>
              </Mark>
              <Size>9.598</Size>
            </Graphic>
          </PointSymbolizer>
          <PointSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Graphic>
              <Mark>
                <WellKnownName>circle</WellKnownName>
                <Fill>
                  <CssParameter name="fill">#FAF9F7</CssParameter>
                </Fill>
              </Mark>
              <Size>7.693</Size>
            </Graphic>
          </PointSymbolizer>
        </Rule>
      </FeatureTypeStyle>     
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
