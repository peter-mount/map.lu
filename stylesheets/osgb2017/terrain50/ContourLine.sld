<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0" xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd">
  <NamedLayer>
    <Name>OS Terrain&#8482; 50 (ContourLine)</Name>
    <UserStyle>
      <Title>Product SLD - July 2016</Title>
      <Abstract>OS Terrain&#174; 50. Ordnance Survey. &#169; Crown copyright 2016.</Abstract>

      <!--  ContourLine  -->

      <FeatureTypeStyle>
        <Rule>
          <Name>Contours - 1:1,001 to 1:33,000</Name>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>feat_type</ogc:PropertyName>
              <ogc:Literal>ContourLine</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <MinScaleDenominator>1001</MinScaleDenominator>
          <MaxScaleDenominator>33000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#E0945E</CssParameter>
              <CssParameter name="stroke-width">0.25</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Name>Contours - 1:33,001 to 1:500,000</Name>
          <MinScaleDenominator>33001</MinScaleDenominator>
          <MaxScaleDenominator>500000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#E0945E</CssParameter>
              <CssParameter name="stroke-width">0.16</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <!--  LandWaterBoundary  -->

      <FeatureTypeStyle>
        <Rule>
          <Name>meanLowWater - 1:1,001 to 1:33,000</Name>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>feat_type</ogc:PropertyName>
                <ogc:Literal>LandWaterBoundary</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>sub_type</ogc:PropertyName>
                <ogc:Literal>meanLowWater</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <MinScaleDenominator>1001</MinScaleDenominator>
          <MaxScaleDenominator>33000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#179AE5</CssParameter>
              <CssParameter name="stroke-width">0.25</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Name>meanLowWater - 1:33,000 to 1:150,000</Name>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>feat_type</ogc:PropertyName>
                <ogc:Literal>LandWaterBoundary</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>sub_type</ogc:PropertyName>
                <ogc:Literal>meanLowWater</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <MinScaleDenominator>33001</MinScaleDenominator>
          <MaxScaleDenominator>150000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#179AE5</CssParameter>
              <CssParameter name="stroke-width">0.16</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Name>meanHighWater - 1:1,001 to 1:33,000</Name>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>feat_type</ogc:PropertyName>
                <ogc:Literal>LandWaterBoundary</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>sub_type</ogc:PropertyName>
                <ogc:Literal>meanHighWater</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <MinScaleDenominator>1001</MinScaleDenominator>
          <MaxScaleDenominator>33000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#179AE5</CssParameter>
              <CssParameter name="stroke-width">1.17</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
        <Rule>
          <Name>meanHighWater 1:33,000 to 1:500,000</Name>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>feat_type</ogc:PropertyName>
                <ogc:Literal>LandWaterBoundary</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>sub_type</ogc:PropertyName>
                <ogc:Literal>meanHighWater</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <MinScaleDenominator>33001</MinScaleDenominator>
          <MaxScaleDenominator>500000</MaxScaleDenominator>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#179AE5</CssParameter>
              <CssParameter name="stroke-width">0.75</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
