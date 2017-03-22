### Goal

Create a trip planner that lets users enter the name of a location, and marks that location (along with any notes the user would like to add) on a map.

### Steps

1. Create an HTML form. Users will use this form to enter a location or address.  

2. Upon submission, the form will trigger an API call to [OpenCage Geocoder](http://geocoder.opencagedata.com/demo.html). You should receive latitude-longitude coordinates in the response.

3. Use Leaflet to...  
  * Convert coordinates to map markers.  
  * Create click listeners for the markers that display the address/location name, latitude-longitude coordinates, and user notes about the location.  

4. Use Leaflet and GeoJSON to...  
  * Visually link each location with the last one rendered with a line. You do not need to start creating lines until two locations have been rendered.
