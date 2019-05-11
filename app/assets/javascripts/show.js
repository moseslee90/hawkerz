function initMap() {
  let mapHTML = document.getElementById('hawker-show-map');
  let latitude = parseFloat(mapHTML.getAttribute('latitude'));
  let longitude = parseFloat(mapHTML.getAttribute('longitude'));
  let hawker = {lat: latitude, lng: longitude};
  map = new google.maps.Map(document.getElementById('hawker-show-map'), {  
    center: {lat: latitude, lng: longitude},
    zoom: 15
  });
  var marker = new google.maps.Marker({position: hawker, map: map});
}