<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>OS VectorMap&#174; District - Backdrop style</Name>
    <UserStyle>
      <Title>Road</Title>
      <Abstract>Ordnance Survey. &#169; Crown copyright 2013.</Abstract>
      
      <!-- ROAD CASINGS -->
      
      <!--  Road Casing 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Road Casing - dual carriageway</Name>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Minor Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>B Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>A Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Primary Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>17500</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#969696</CssParameter>
              <CssParameter name="stroke-width">25</CssParameter>  
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Name>Road Casing - single carriageway</Name>
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
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Pedestrianised Street</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Minor Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>B Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>A Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Primary Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Motorway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>17500</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#969696</CssParameter>
              <CssParameter name="stroke-width">16</CssParameter>  
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Road Casing 1:17,500 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Road Casing - dual carriageway</Name>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Minor Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>B Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>A Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Primary Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <MinScaleDenominator>17500</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#A6A5A4</CssParameter>
              <CssParameter name="stroke-width">25</CssParameter>  
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Name>Road Casing - single carriageway</Name>
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
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Pedestrianised Street</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Minor Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>B Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>A Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Primary Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Motorway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <MinScaleDenominator>17500</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#A6A5A4</CssParameter>
              <CssParameter name="stroke-width">16</CssParameter>  
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!-- SC FILLS -->
      
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
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FCFCFC</CssParameter>
              <CssParameter name="stroke-width">13</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
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
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FFF4E1</CssParameter>
              <CssParameter name="stroke-width">13</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Pedestrian Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Ped Street Fill 1:9,500 to 1:12,500</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Pedestrianised Street</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#EEEEEE</CssParameter>
              <CssParameter name="stroke-width">13</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <!--  Motorway Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Motorway Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Motorway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#63C8DD</CssParameter>
              <CssParameter name="stroke-width">13</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
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
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#F7D6B5</CssParameter>
              <CssParameter name="stroke-width">13</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
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
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FFBBD2</CssParameter>
              <CssParameter name="stroke-width">13</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
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
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#A3D2A9</CssParameter>
              <CssParameter name="stroke-width">13</CssParameter> 
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      
      <!-- DC FILLS -->
      
      <!--  Minor Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Minor Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Minor Road, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FFF4E1</CssParameter>
              <CssParameter name="stroke-width">21.5</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  B Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>B Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>B Road, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#F7D6B5</CssParameter>
              <CssParameter name="stroke-width">21.5</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  A Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>A Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>A Road, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FFBBD2</CssParameter>
              <CssParameter name="stroke-width">21.5</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Primary Road Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Primary Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Primary Road, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#A3D2A9</CssParameter>
              <CssParameter name="stroke-width">21.5</CssParameter> 
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Motorway Fill 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Motorway Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#63C8DD</CssParameter>
              <CssParameter name="stroke-width">21.5</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!-- DC CENTRAL RESERVATIONS -->
      
      <!--  Minor Road 1:7,142 to 1:17,500 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Minor Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Minor Road, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>17500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#969696</CssParameter>
              <CssParameter name="stroke-width">0.108</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  B Road 1:7,142 to 1:17,500 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>B Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>B Road, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>17500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#969696</CssParameter>
              <CssParameter name="stroke-width">0.108</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  A Road 1:7,142 to 1:17,500 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>A Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>A Road, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>17500</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#969696</CssParameter>
              <CssParameter name="stroke-width">0.19</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Primary Road 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Primary Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Primary Road, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FFFFFF</CssParameter>
              <CssParameter name="stroke-width">0.284</CssParameter> 
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Motorway 1:7,142 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Motorway Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <LineSymbolizer uom="http://www.opengeospatial.org/se/units/metre">
            <Stroke>
              <CssParameter name="stroke">#FFFFFF</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter> 
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!-- ROAD nameS AND NUMBERS -->
      
      <!--  Motorway Labels 1:7,142 to 1:9,000 -->
      <!-- NB: We choose not to label single carriageway motorway (often better for automated cartography) -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Motorway Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>9000</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>dftnumber</ogc:PropertyName>
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">13</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/MwayNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>20</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Minor Road Labels 1:7,142 to 1:9,000 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Minor Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Minor Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>9000</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#737171</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>    
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      
      <!--  B Road Labels 1:7,142 to 1:9,000 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>B Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>B Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>9000</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">13</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#D49E72</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>   
          </TextSymbolizer>                    
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>dftnumber</ogc:PropertyName>                
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">13</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/BRdNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>21</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  A Road Labels 1:7,142 to 1:9,000 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>A Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>A Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>9000</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">14</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#D696AB</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>   
          </TextSymbolizer>   
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>dftnumber</ogc:PropertyName>
                <ogc:Literal>&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">14</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/ARdNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>21</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Primary Road Labels 1:7,142 to 1:9,000 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Primary Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Primary Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>7142</MinScaleDenominator>
          <MaxScaleDenominator>9000</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>name</ogc:PropertyName>                 
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">14</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#82AD88</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>dftnumber</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">13</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/PrmyNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>21</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Motorway Fill 1:9,000 to 1:12,500 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Motorway Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>9000</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>dftnumber</ogc:PropertyName>
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/MwayNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>20</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Minor Road Fill 1:9,000 to 1:12,500 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Minor Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Minor Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>9000</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#737171</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>    
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  B Road Fill 1:9,000 to 1:12,500 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>B Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>B Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>9000</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#D49E72</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>   
          </TextSymbolizer>                    
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>dftnumber</ogc:PropertyName>                
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/BRdNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>20</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  A Road Fill 1:9,000 to 1:12,500 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>A Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>A Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>9000</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#D76B8F</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>   
          </TextSymbolizer>   
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>dftnumber</ogc:PropertyName>
                <ogc:Literal>&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/ARdNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>20</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Primary Road Fill 1:9,000 to 1:12,500 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Primary Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Primary Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>9000</MinScaleDenominator>
          <MaxScaleDenominator>12500</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>name</ogc:PropertyName>                 
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">13</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#78B37F</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>dftnumber</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/PrmyNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>20</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Motorway Fill 1:12,500 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Motorway Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>12500</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>dftnumber</ogc:PropertyName>
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/MwayNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>18</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Minor Road Fill 1:12,500 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Minor Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Minor Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>12500</MinScaleDenominator>
          <MaxScaleDenominator>17500</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">9</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#737171</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>    
          </TextSymbolizer>
        </Rule>
        <Rule>
          <Name>Minor Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Minor Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>17500</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">9</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#838181</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>    
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle> 
      
      <!--  B Road Fill 1:12,500 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>B Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>B Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>12500</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#D49E72</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>   
          </TextSymbolizer>                    
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>dftnumber</ogc:PropertyName>                
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/BRdNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>18</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  A Road Fill 1:12,500 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>A Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>A Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>12500</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>name</ogc:PropertyName>
                <ogc:Literal>&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#D76B8F</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>   
          </TextSymbolizer>   
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>dftnumber</ogc:PropertyName>
                <ogc:Literal>&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/ARdNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>18</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <!--  Primary Road Fill 1:12,500 to 1:23,607 -->
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Primary Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsLike  wildCard="*" singleChar="." escape="!">
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Primary Road*</ogc:Literal>
            </ogc:PropertyIsLike>
          </ogc:Filter>
          <MinScaleDenominator>12500</MinScaleDenominator>
          <MaxScaleDenominator>23607</MaxScaleDenominator>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>name</ogc:PropertyName>                 
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement/>
            </LabelPlacement>
            <Halo>
              <Radius>2</Radius>
              <Fill><CssParameter name="fill">#FAF9F7</CssParameter></Fill>
            </Halo>
            <Fill>
              <CssParameter name="fill">#78B37F</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxAngleDelta">45</VendorOption>
            <VendorOption name="maxDisplacement">175</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
          <TextSymbolizer>
            <Label>
              <ogc:Function name="strConcat">
                <ogc:PropertyName>dftnumber</ogc:PropertyName>
                <ogc:Literal>&#160;&#160;</ogc:Literal>
              </ogc:Function>                  
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">11</CssParameter>
              <CssParameter name="font-weight">bold</CssParameter>
            </Font>
            <LabelPlacement>
              <PointPlacement>
                <AnchorPoint>
                  <AnchorPointX>0.5</AnchorPointX>
                  <AnchorPointY>0.5</AnchorPointY>
                </AnchorPoint>
                <Displacement>
                  <DisplacementX>0</DisplacementX>
                  <DisplacementY>1</DisplacementY>
                </Displacement>
              </PointPlacement>
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#FFFFFF</CssParameter>
            </Fill>
            <Graphic>
              <ExternalGraphic>
                <OnlineResource xlink:href="vmdsymbols/Backdrop/PrmyNoBox.svg"/>
                <Format>image/svg+xml</Format>
              </ExternalGraphic>
              <Size>18</Size>
            </Graphic>
            <VendorOption name="spaceAround">10</VendorOption>
            <VendorOption name="group">yes</VendorOption>
            <VendorOption name="maxDisplacement">2500</VendorOption>
            <VendorOption name="repeat">2000</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <!-- map.lu changes for higher scales -->

      <FeatureTypeStyle>
        <Rule>
          <Name>Minor Road Fill</Name>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>Minor Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
		<ogc:PropertyName>classifica</ogc:PropertyName>
		<ogc:Literal>Minor Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>B Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>B Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <MinScaleDenominator>23607</MinScaleDenominator>
          <MaxScaleDenominator>800000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FFF4E1</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <FeatureTypeStyle>
        <Rule>
          <Name>A Road Fill</Name>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsEqualTo>
		<ogc:PropertyName>classifica</ogc:PropertyName>
		<ogc:Literal>A Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>A Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <MinScaleDenominator>23607</MinScaleDenominator>
          <MaxScaleDenominator>800000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FFBBD2</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <FeatureTypeStyle>
        <Rule>
          <Name>A Road Fill</Name>
          <ogc:Filter>
            <ogc:Or>
              <ogc:PropertyIsEqualTo>
		<ogc:PropertyName>classifica</ogc:PropertyName>
		<ogc:Literal>A Road</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>classifica</ogc:PropertyName>
                <ogc:Literal>A Road, Collapsed Dual Carriageway</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:Or>
          </ogc:Filter>
          <MinScaleDenominator>800000</MinScaleDenominator>
          <MaxScaleDenominator>1400000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#FFBBD2</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Primary Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Primary Road</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>23607</MinScaleDenominator>
          <MaxScaleDenominator>400000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#A3D2A9</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter> 
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Primary Road Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Primary Road</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>400000</MinScaleDenominator>
          <MaxScaleDenominator>800000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#A3D2A9</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter> 
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Motorway Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>23607</MinScaleDenominator>
          <MaxScaleDenominator>800000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#63C8DD</CssParameter>
              <CssParameter name="stroke-width">2</CssParameter> 
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
      <FeatureTypeStyle>
        <Rule>
          <Name>Motorway Fill</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>classifica</ogc:PropertyName>
              <ogc:Literal>Motorway, Collapsed Dual Carriageway</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>800000</MinScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#63C8DD</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter> 
              <CssParameter name="stroke-linecap">round</CssParameter>
              <CssParameter name="stroke-linejoin">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
