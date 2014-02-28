$(document).ready(function() {
  var initialize;
  initialize = function() {
    var airportMarker, airportPosition, clubSantiagoMarker, clubSantiagoPosition, map, map_canvas, map_options;
    clubSantiagoPosition = new google.maps.LatLng(19.118386, -104.394472);
    airportPosition = new google.maps.LatLng(19.144722, -104.556419);
    map_canvas = document.getElementById("map_canvas");
    map_options = {
      center: new google.maps.LatLng(19.051085, -104.382133),
      zoom: 11,
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
    return airportMarker = new google.maps.Marker({
      position: airportPosition,
      map: map,
      title: "airport"
    });
  };
  return google.maps.event.addDomListener(window, "load", initialize);
});
