function initialize() {
  var airportMarker, airportPosition, clubSantiagoMarker, clubSantiagoPosition, map, map_canvas, map_options;
  clubSantiagoPosition = new google.maps.LatLng(19.118386, -104.394472);
  airportPosition = new google.maps.LatLng(19.144722, -104.556419);
  map_canvas = document.getElementById("map_canvas");
  map_options = {
    center: new google.maps.LatLng(26.051085, -109.382133),
    zoom: 4,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    scrollwheel: false,
    disableDefaultUI: true,
    draggable: false,
    disableDoubleClickZoom: true
  };
  map = new google.maps.Map(map_canvas, map_options);
  clubSantiagoMarker = new google.maps.Marker({
    position: clubSantiagoPosition,
    map: map,
    title: "Club Santiago"
  });
}

function loadScript() {
  var script = document.createElement('script');
  script.type = 'text/javascript';
  script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp' +
      '&callback=initialize';
  document.body.appendChild(script);
}

window.onload = loadScript;
