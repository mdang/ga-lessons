#Google Maps API

For this session we are going to play with the maps API. You have the option to either follow along, or put your headphones on and work through the [official documentation](https://developers.google.com/maps/documentation/javascript/reference) and this markdown on your own. 

First let us checkout a quick example of some cool stuff you can do on google maps. This is a spike from Project 4 cycle of a follow student of WDI 7/8. Very cool use of google maps overlays. 

[Heatmaps](http://heat-maps.herokuapp.com/) by [Justin Curatolo](https://github.com/jcuratolo)



1. Create a basic map
2. Overlays (markers, zones etc...)
3. Map events
4. Map controls
5. Map Types


---
####Google Developers API Key

You may want to [register](https://console.developers.google.com) for an API key with google

Google will allow you to make many requests per day. If you plan for heavy traffic, or using other google APIs, you should get a free API key from Google.

Go to [https://console.developers.google.com](https://console.developers.google.com) to register.


---



##Step 1: Create a Basic Google Map

######A - Load the Google API

Google maps is a javascript library, it can be loaded using the script tags
	
```
without API key

< script src="http://maps.googleapis.com/maps/api/js"> </script>

or with API key

< script src="http://maps.googleapis.com/maps/api/js?key=YOUR_KEY"></script>


```

######B - Set Map Properties

Create a function to initialize the map

```
function initialize() {
}

```

In the initialize function, create an object (mapProperties) to define (some default) properties for the map. When you get rocking you can set your own properties:

```
var mapProperties = {
  center:new google.maps.LatLng(34.0129821,-118.495196),
  zoom: 17,
  mapTypeId: google.maps.MapTypeId.ROADMAP
};

```

######C - Create a Map Container

Create a <div> element to hold the map.

```
< div id="googleMap" "style="width:500px;height:380px;"></div>

```

Don't forget to give it a height and width (you can use inline style just this once!!!!)


######D - Create a Map Object

``` 
var map=new google.maps.Map(document.getElementById("googleMap"), mapProperties);

```

The code above creates a new map inside the < div > element with id="googleMap", using the parameters that are passed (mapProperties).



######E - Add an Event Listener to Load the Map

Add a DOM listener that will execute the initialize() function on window load (when the page is loaded):

```
google.maps.event.addDomListener(window, 'load', initialize);

```

##Step 2: Overlays

<br/>

Overlays are objects on the map that are bound to latitude/longitude coordinates. Google Maps has several types of overlays:

**Marker** - Single locations on a map. Markers can also display custom icon images

```

//adds a marker
var marker=new google.maps.Marker({
  position:myCenter, 
  animation:google.maps.Animation.BOUNCE, //animates the marker
  icon:'pinkball.png' // replace default marker with custom icon
  });
marker.setMap(map);

```


**Info Windows** - Displays content within a popup balloon on top of a map

```
var infowindow = new google.maps.InfoWindow({
  content:"Hello World!"
  });

infowindow.open(map,marker);

```

**Polyline** - Series of straight lines on a map. Supports the following properties:

* path - specifies several latitude/longitude coordinates for the line
* strokeColor - specifies a hexadecimal color for the line (format: "#FFFFFF")
* strokeOpacity - specifies the opacity of the line (a value between 0.0 and 1.0)
* strokeWeight - specifies the weight of the line's stroke in pixels
* editable - defines whether the line is editable by users (true/false)

```
var myTrip = [stavanger,amsterdam,london];
var flightPath = new google.maps.Polyline({
  path:myTrip,
  strokeColor:"#0000FF",
  strokeOpacity:0.8,
  strokeWeight:2
});
```

**Polygon** - Series of straight lines on a map, and the shape is "closed". Supports the following properties:

* path - specifies several LatLng coordinates for the line (first and last coordinate are equal)
* strokeColor - specifies a hexadecimal color for the line (format: "#FFFFFF")
* strokeOpacity - specifies the opacity of the line (a value between 0.0 and 1.0)
* strokeWeight - specifies the weight of the line's stroke in pixels
* fillColor - specifies a hexadecimal color for the area within the enclosed region (format: "#FFFFFF")
* fillOpacity - specifies the opacity of the fill color (a value between 0.0 and 1.0)
* editable - defines whether the line is editable by users (true/false)

```
var myTrip = [paris,chicago,london,paris];
var flightPath = new google.maps.Polygon({
  path:myTrip,
  strokeColor:"#0000FF",
  strokeOpacity:0.8,
  strokeWeight:2,
  fillColor:"#0000FF",
  fillOpacity:0.4
});

```

##Step 3: Map Events
<br/>
Click The Marker to Zoom

```

// Zoom to 9 when clicking on marker
google.maps.event.addListener(marker,'click',function() {
  map.setZoom(9);
  map.setCenter(marker.getPosition());
  });

```

Open an InfoWindow when clicking on the marker


```
var infowindow = new google.maps.InfoWindow({
  content:"Hello World!"
  });

google.maps.event.addListener(marker, 'click', function() {
  infowindow.open(map,marker);
  });
```


Set markers and open InfoWindow for each marker

```
google.maps.event.addListener(map, 'click', function(event) {
  placeMarker(event.latLng);
  });

function placeMarker(location) {
  var marker = new google.maps.Marker({
    position: location,
    map: map,
  });
  var infowindow = new google.maps.InfoWindow({
    content: 'Latitude: ' + location.lat() +
    '<br>Longitude: ' + location.lng()
  });
  infowindow.open(map,marker);
}
```
##Step 4: Map Controls

There are many controls (see documentation) but here are a few to get you started. 

* Zoom - displays a slider or "+/-" buttons to control the zoom level of the map
* Pan - displays a pan control for panning the map
* MapType - lets the user toggle between map types (roadmap and satellite)
* Street View - displays a Pegman icon which can be dragged to the map to enable Street View
* Scale - displays a map scale element
* Rotate - displays a small circular icon which allows you to rotate maps
* Overview Map - displays a thumbnail overview map reflecting the current map viewport within a wider area

##Step 5: Map Types



* ROADMAP (normal, default 2D map)
* SATELLITE (photographic map)
* HYBRID (photographic map + roads and city names)
* TERRAIN (map with mountains, rivers, etc.)