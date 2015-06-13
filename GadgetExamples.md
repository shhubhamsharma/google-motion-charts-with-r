
# `googleVis` Examples #
These examples illustrate how the googleVis package can be used to create interactive charts.
More examples are available via demo('googleVis').
## Motion Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/motionchart.xml" width="400" height="350" border="0"/&gt;
```
library(googleVis)
Motion=gvisMotionChart(Fruits, idvar="Fruit", timevar="Year", options=list(height=350, width=400))
# Display chart
plot(Motion) 
# Create Google Gadget
cat(createGoogleGadget(Motion), file="motionchart.xml")
```

## Geo Map ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/geomap.xml" width="600" height="350" border="0"/&gt;
```
Geo=gvisGeoMap(Exports, locationvar="Country", numvar="Profit",
                       options=list(dataMode='regions'))
# Display chart
plot(Geo) 
# Create Google Gadget
cat(createGoogleGadget(Geo), file="geomap.xml")
```

&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/andrewgeomap.xml" width="400" height="250" border="0"/&gt;
```
AndrewGeo <- gvisGeoMap(Andrew, locationvar="LatLong", numvar="Speed_kt", 
      			 hovervar="Category", 
      		         options=list(height=250, width=400, region="US"))

# Display chart
plot(AndrewGeo) 
# Create Google Gadget
cat(createGoogleGadget(AndrewGeo), file="andrewgeomap.xml")
```

## Map ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/andrewmap.xml" width="650" height="500" border="0"/&gt;
```
AndrewMap <- gvisMap(Andrew, "LatLong" , "Tip", 
      	      options=list(showTip=TRUE, showLine=TRUE, enableScrollWheel=TRUE,
		      mapType='terrain', useMapTypeControl=TRUE))
# Display chart
plot(AndrewMap) 
# Create Google Gadget
cat(createGoogleGadget(AndrewMap), file="andrewmap.xml")
```

## Geo Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/geochart.xml" width="600" height="360" border="0"/&gt;
```
GeoChart <- gvisGeoChart(Exports, "Country", "Profit",
                         options=list(region="150"))
# Display chart
plot(GeoChart)
# Create Google Gadget
cat(createGoogleGadget(GeoChart), file="geochart.xml")
```

## Table ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/table.xml" width="400" height="300" border="0"/&gt;
```
Table <- gvisTable(Exports, options=list(width=400, height=270))
# Display chart
plot(Table) 
# Create Google Gadget
cat(createGoogleGadget(Table), file="table.xml")
```

&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/poptable.xml" width="600" height="300" border="0"/&gt;
```
PopTable <- gvisTable(Population, options=list(width=600, height=300, page='enable'))
# Display chart
plot(PopTable) 
# Create Google Gadget
cat(createGoogleGadget(PopTable), file="poptable.xml")
```

## Annotated Time Line ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/annotimeline.xml" width="420" height="270" border="0"/&gt;
```
AnnoTimeLine  <- gvisAnnotatedTimeLine(Stock, datevar="Date",
                           numvar="Value", idvar="Device",
                           titlevar="Title", annotationvar="Annotation",
                           options=list(displayAnnotations=TRUE,
                             legendPosition='newRow',
                             width=400, height=250)
                           )
# Display chart
plot(AnnoTimeLine) 
# Create Google Gadget
cat(createGoogleGadget(AnnoTimeLine), file="annotimeline.xml")
```

## Tree Map ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/statestreemap.xml" width="400" height="300" border="0"/&gt;
```
require(datasets)
states <- data.frame(state.name, state.area)

states3 <- data.frame(state.region, state.division, state.name, state.area)

regions <- aggregate(list(region.area=states3$state.area),
                     list(region=state.region), sum)

divisions <- aggregate(list(division.area=states3$state.area),
                     list(division=state.division, region=state.region),
                     sum)

my.states3 <- data.frame(regionid=c("USA",
                                    as.character(regions$region),
                                    as.character(divisions$division),
                                    as.character(states3$state.name)),
                         parentid=c(NA, rep("USA", 4), 
                                   as.character(divisions$region),
                                   as.character(states3$state.division)),
                         state.area=c(sum(states3$state.area),
                                      regions$region.area,
                                      divisions$division.area,
                                      states3$state.area))

my.states3$state.area.log=log(my.states3$state.area)

statesTree3 <- gvisTreeMap(my.states3, "regionid", "parentid",
                           "state.area", "state.area.log", options=list(showScale=TRUE, width=400, height=300))
# Display chart
plot(statesTree3) 
# Create Google Gadget
cat(createGoogleGadget(statesTree3), file="statestreemap.xml")
```
## Line Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/linechart.xml" width="300" height="200" border="0"/&gt;
```
df=data.frame(country=c("US", "GB", "BR"), val1=c(1,3,4), val2=c(23,12,32))
## Line chart
Line <- gvisLineChart(df,
                options=list(legend='none', width=300, height=200))
plot(Line)
cat(createGoogleGadget(Line), file="linechart.xml")
```
## Bar Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/barchart.xml" width="300" height="200" border="0"/&gt;
```
## Bar chart
Bar <- gvisBarChart(df,
                    options=list(legend='none', width=300, height=200))
plot(Bar)
cat(createGoogleGadget(Bar), file="barchart.xml")
```
## Column Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/columnchart.xml" width="300" height="200" border="0"/&gt;
```
## Column chart
Column <- gvisColumnChart(df,
                          options=list(legend='none', width=300, height=200))
plot(Column)
cat(createGoogleGadget(Column), file="columnchart.xml")
```
## Area Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/areachart.xml" width="300" height="300" border="0"/&gt;
```
## Area chart
Area <- gvisAreaChart(df,
                          options=list(legend='none', width=300, height=300))
plot(Area)
cat(createGoogleGadget(Area), file="areachart.xml")
```
## Stepped Area Chart ##
&lt;wiki:gadget url="http://dl.dropbox.com/u/7586336/googleVisExamples/Gadgets/SteppedAreaGadget.xml", width="300" height="300" border="0"/&gt;
```
## Stepped Area Chart
SteppedArea <- gvisSteppedAreaChart(df, xvar="country", yvar=c("val1", "val2"),
      options=list(isStacked=TRUE,  width=300, height=290))
plot(SteppedArea)
cat(createGoogleGadget(Area), file="steppedareachart.xml")
```
## Scatter Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/scatterchart.xml" width="300" height="300" border="0"/&gt;
```
## Scatter chart
Scatter <- gvisScatterChart(women, options=list(legend="none",
                 lineWidth=2, pointSize=0, hAxis.title="weight",
                 title="Women", vAxis="{title:'height'}",
                 hAxis="{title:'weight'}", width=300, height=300))
plot(Scatter)
cat(createGoogleGadget(Scatter), file="scatterchart.xml")
```
## Bubble Chart ##
&lt;wiki:gadget url="http://dl.dropbox.com/u/7586336/googleVisExamples/Gadgets/bubblechart.xml" width="500" height="300" border="0"/&gt;
```
## Bubble chart
Bubble <- gvisBubbleChart(Fruits, idvar="Fruit", xvar="Sales", yvar="Expenses",
                           colorvar="Year", sizevar="Profit",
                           options=list(hAxis='{minValue:75, maxValue:125}',
                             width=500, height=300))

cat(createGoogleGadget(Bubble), file="bubblechart.xml")
```
## Pie Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/piechart.xml" width="400" height="200" border="0"/&gt;
```
## Pie chart
Pie <- gvisPieChart(CityPopularity,
                    options=list(width=400, height=200))
plot(Pie)
cat(createGoogleGadget(Pie), file="piechart.xml")
```
## Gauge ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/gauge.xml" width="300" height="220" border="0"/&gt;
```
## Gauge
Gauge <-  gvisGauge(CityPopularity, options=list(min=0, max=800, greenFrom=500,
                                      greenTo=800, yellowFrom=300, yellowTo=500,
                                      redFrom=0, redTo=300, width=300, height=220))
plot(Gauge)
cat(createGoogleGadget(Gauge), file="gauge.xml")
```
## Intensity Map ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/intensitymap.xml" width="600" height="300" border="0"/&gt;
```
## Intensity Map
Intensity <- gvisIntensityMap(df)
plot(Intensity)
cat(createGoogleGadget(Intensity), file="intensitymap.xml")
```
## Org Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/orgchart.xml" width="630" height="250" border="0"/&gt;
```
## Org chart
Org <- gvisOrgChart(Regions, options=list(width=600, height=210,
                               size='large', allowCollapse=TRUE))
plot(Org)
cat(createGoogleGadget(Org), file="orgchart.xml")
```
## Candlestick Chart ##
&lt;wiki:gadget url="http://google-motion-charts-with-r.googlecode.com/svn-history/r292/trunk/inst/gadgets/candlestickchart.xml" width="650" height="250" border="0"/&gt;
```
## Org chart
Candle <- gvisCandlestickChart(OpenClose, xvar="Weekday", low="Low",
                                      open="Open", close="Close",
                                      high="High",
                                      options=list(legend='none',
                                        width=300, height=250))
plot(Candle)
cat(createGoogleGadget(Org), file="candlestickchart.xml")
```