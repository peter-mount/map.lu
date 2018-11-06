
<?xml version="1.0" encoding="ISO-8859-1"?>
<StyledLayerDescriptor version="1.0.0"
  xsi:schemaLocation="http://www.opengis.net/sld http://schemas.opengis.net/sld/1.0.0/StyledLayerDescriptor.xsd"
  xmlns="http://www.opengis.net/sld" xmlns:ogc="http://www.opengis.net/ogc"
  xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

  <!--
  This represents mainline, preserved & disused railways.

  A common filter in use is:

  <ogc:Or>
    <ogc:PropertyIsNull>
      <ogc:PropertyName>layer</ogc:PropertyName>
    </ogc:PropertyIsNull>
    <ogc:PropertyIsGreaterThanOrEqualTo>
      <ogc:PropertyName>layer</ogc:PropertyName>
      <ogc:Literal>-1</ogc:Literal>
    </ogc:PropertyIsGreaterThanOrEqualTo>
  </ogc:Or>

  which is needed as some underground entries need to be hidden,
  e.g. London Underground, Post Office Mail Rail which would appear on this layer.
  In most instances null is fine but some stations have layer=-1 so we need that
  as well - tube seems to be <= -2

  Some features with railway="rail" don't check layer as some lines are beneath others.
  Note: We may need to order features by layer at some point
  -->
  <NamedLayer>
    <Name>rail_line</Name>
    <UserStyle>
      <Title>Rail Line</Title>

      <!--
        dummy entry used to show everything so we can select new features.
        Uncomment this out only for debugging or adding features.
      -->
      <FeatureTypeStyle>
        <Rule>
          <Title>Other</Title>
          <!--
          <ogc:Filter>
            <ogc:PropertyIsNull>
              <ogc:PropertyName>layer</ogc:PropertyName>
            </ogc:PropertyIsNull>
          </ogc:Filter>
        -->
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#cc0000</CssParameter>
              <CssParameter name="stroke-width">0.5</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <!-- Platforms -->
      <FeatureTypeStyle>
        <Rule>
          <Title>Platform</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>platform</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:Or>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>layer</ogc:PropertyName>
                </ogc:PropertyIsNull>
                <ogc:PropertyIsGreaterThanOrEqualTo>
                  <ogc:PropertyName>layer</ogc:PropertyName>
                  <ogc:Literal>0</ogc:Literal>
                </ogc:PropertyIsGreaterThanOrEqualTo>
              </ogc:Or>
            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#666666</CssParameter>
              <CssParameter name="stroke-width">1.5</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>name</ogc:PropertyName>
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">10</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement />
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#000000</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>
      <FeatureTypeStyle>
        <Rule>
          <Title>Platform (Linear)</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>platform</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:Or>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>layer</ogc:PropertyName>
                </ogc:PropertyIsNull>
                <ogc:PropertyIsGreaterThanOrEqualTo>
                  <ogc:PropertyName>layer</ogc:PropertyName>
                  <ogc:Literal>0</ogc:Literal>
                </ogc:PropertyIsGreaterThanOrEqualTo>
              </ogc:Or>
            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#888888</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
              <CssParameter name="stroke-linecap">round</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <FeatureTypeStyle>
        <Rule>
          <Title>Tunnel</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>rail</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>tunnel</ogc:PropertyName>
                <ogc:Literal>yes</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#333333</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
              <CssParameter name="stroke-dasharray">5 2</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <FeatureTypeStyle>
        <Rule>
          <Title>Spur</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>rail</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>service</ogc:PropertyName>
                <ogc:Literal>spur</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#888888</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <FeatureTypeStyle>
        <Rule>
          <Title>Siding</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>rail</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>service</ogc:PropertyName>
                <ogc:Literal>siding</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#888888</CssParameter>
              <CssParameter name="stroke-width">0.5</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <FeatureTypeStyle>
        <Rule>
          <Title>Yard</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>rail</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>service</ogc:PropertyName>
                <ogc:Literal>yard</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#888888</CssParameter>
              <CssParameter name="stroke-width">0.5</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <FeatureTypeStyle>
        <Rule>
          <Title>Crossover</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>rail</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>service</ogc:PropertyName>
                <ogc:Literal>crossover</ogc:Literal>
              </ogc:PropertyIsEqualTo>
            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#555555</CssParameter>
              <CssParameter name="stroke-width">0.5</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <FeatureTypeStyle>
        <Rule>
          <Title>Line Unreferenced</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>rail</ogc:Literal>
              </ogc:PropertyIsEqualTo>

              <ogc:And>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>ref</ogc:PropertyName>
                </ogc:PropertyIsNull>

                <ogc:PropertyIsNull>
                  <ogc:PropertyName>service</ogc:PropertyName>
                </ogc:PropertyIsNull>

                <ogc:Or>
                  <ogc:PropertyIsNull>
                    <ogc:PropertyName>tunnel</ogc:PropertyName>
                  </ogc:PropertyIsNull>
                  <ogc:PropertyIsNotEqualTo>
                    <ogc:PropertyName>tunnel</ogc:PropertyName>
                    <ogc:Literal>yes</ogc:Literal>
                  </ogc:PropertyIsNotEqualTo>
                </ogc:Or>
              </ogc:And>

            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#333333</CssParameter>
              <CssParameter name="stroke-width">0.5</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>name</ogc:PropertyName>
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement />
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#000000</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <!-- Line with a reference -->
      <FeatureTypeStyle>
        <Rule>
          <Title>Line</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>rail</ogc:Literal>
              </ogc:PropertyIsEqualTo>

              <ogc:And>
                <ogc:Not>
                  <ogc:PropertyIsNull>
                    <ogc:PropertyName>ref</ogc:PropertyName>
                  </ogc:PropertyIsNull>
                </ogc:Not>

                <ogc:PropertyIsNull>
                  <ogc:PropertyName>service</ogc:PropertyName>
                </ogc:PropertyIsNull>

                <ogc:Or>
                  <ogc:PropertyIsNull>
                    <ogc:PropertyName>tunnel</ogc:PropertyName>
                  </ogc:PropertyIsNull>
                  <ogc:PropertyIsNotEqualTo>
                    <ogc:PropertyName>tunnel</ogc:PropertyName>
                    <ogc:Literal>yes</ogc:Literal>
                  </ogc:PropertyIsNotEqualTo>
                </ogc:Or>
              </ogc:And>

            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#333333</CssParameter>
              <CssParameter name="stroke-width">1</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>ref</ogc:PropertyName>
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement />
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#0000ff</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <FeatureTypeStyle>
        <Rule>
          <Title>Disused</Title>
          <ogc:Filter>
            <ogc:And>
              <ogc:PropertyIsEqualTo>
                <ogc:PropertyName>railway</ogc:PropertyName>
                <ogc:Literal>disused</ogc:Literal>
              </ogc:PropertyIsEqualTo>
              <ogc:Or>
                <ogc:PropertyIsNull>
                  <ogc:PropertyName>layer</ogc:PropertyName>
                </ogc:PropertyIsNull>
                <ogc:PropertyIsGreaterThanOrEqualTo>
                  <ogc:PropertyName>layer</ogc:PropertyName>
                  <ogc:Literal>-1</ogc:Literal>
                </ogc:PropertyIsGreaterThanOrEqualTo>
              </ogc:Or>
            </ogc:And>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#aaaaaa</CssParameter>
              <CssParameter name="stroke-width">0.5</CssParameter>
              <CssParameter name="stroke-dasharray">2 2</CssParameter>
            </Stroke>
          </LineSymbolizer>
        </Rule>
      </FeatureTypeStyle>

      <!-- Preserved line -->
      <FeatureTypeStyle>
        <Rule>
          <Title>Preserved</Title>
          <ogc:Filter>
            <ogc:PropertyIsEqualTo>
              <ogc:PropertyName>railway</ogc:PropertyName>
              <ogc:Literal>preserved</ogc:Literal>
            </ogc:PropertyIsEqualTo>
          </ogc:Filter>
          <LineSymbolizer>
            <Stroke>
              <CssParameter name="stroke">#888888</CssParameter>
              <CssParameter name="stroke-width">0.5</CssParameter>
              <CssParameter name="stroke-dasharray">3 3</CssParameter>
            </Stroke>
          </LineSymbolizer>
          <TextSymbolizer>
            <Label>
              <ogc:PropertyName>name</ogc:PropertyName>
            </Label>
            <Font>
              <CssParameter name="font-family">Arial</CssParameter>
              <CssParameter name="font-size">12</CssParameter>
            </Font>
            <LabelPlacement>
              <LinePlacement />
            </LabelPlacement>
            <Fill>
              <CssParameter name="fill">#000000</CssParameter>
            </Fill>
            <VendorOption name="followLine">true</VendorOption>
          </TextSymbolizer>
        </Rule>
      </FeatureTypeStyle>

    </UserStyle>
  </NamedLayer>
</StyledLayerDescriptor>
