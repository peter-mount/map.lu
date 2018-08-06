<?xml version="1.0" encoding="UTF-8"?>
<StyledLayerDescriptor xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.opengis.net/sld
http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd" version="1.0.0">
  <NamedLayer>
    <Name>Total_cloud_cover_entire_atmosphere_6_Hour_Average</Name>
    <UserStyle>
      <Title>Total cloud cover entire atmosphere 6 Hour Average</Title>
      <FeatureTypeStyle>
        <Rule>
          <RasterSymbolizer>
            <Opacity>1.0</Opacity>
            <ColorMap type="ramp">
              <!-- This is a Percentage of cover so use the same colour but set opacity to the value -->
              <ColorMapEntry color="#000000" quantity="0" label="Clear" opacity="0.0"/>
              <ColorMapEntry color="#AAAAAA" quantity="10" label="10%" opacity="0.1"/>
              <ColorMapEntry color="#AAAAAA" quantity="20" label="20%" opacity="0.2"/>
              <ColorMapEntry color="#AAAAAA" quantity="30" label="30%" opacity="0.3"/>
              <ColorMapEntry color="#AAAAAA" quantity="40" label="40%" opacity="0.4"/>
              <ColorMapEntry color="#AAAAAA" quantity="50" label="50%" opacity="0.5"/>
              <ColorMapEntry color="#AAAAAA" quantity="60" label="60%" opacity="0.6"/>
              <ColorMapEntry color="#AAAAAA" quantity="70" label="70%" opacity="0.7"/>
              <ColorMapEntry color="#AAAAAA" quantity="80" label="80%" opacity="0.8"/>
              <ColorMapEntry color="#AAAAAA" quantity="90" label="90%" opacity="0.9"/>
              <ColorMapEntry color="#AAAAAA" quantity="99" label="100%"/>
            </ColorMap>
          </RasterSymbolizer>
        </Rule>
      </FeatureTypeStyle>
    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
