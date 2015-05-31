var map, pointarray, heatmap;

function initialize() {
  var mapOptions = {
    zoom: 11,
    center: new google.maps.LatLng(43.6863545, -79.2899805),
    mapTypeId: google.maps.MapTypeId.SATELLITE
  };

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var pointArray = new google.maps.MVCArray(ticketData);

  heatmap = new google.maps.visualization.HeatmapLayer({
    data: pointArray
  });

  heatmap.setMap(map);
  heatmap.setOptions(options);
}

google.maps.event.addDomListener(window, 'load', initialize);


