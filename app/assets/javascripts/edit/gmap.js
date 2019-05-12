function iHateRuby() {
  let hawkerEditMap = document.getElementById('hawker-edit-map');
  let currentLat = parseFloat(hawkerEditMap.getAttribute('latitude'));
  let currentLng = parseFloat(hawkerEditMap.getAttribute('longitude'));
  let hawker = { lat: currentLat, lng: currentLng };

  var map = new google.maps.Map(document.getElementById('map'), {
    center: { lat: currentLat, lng: currentLng },
    zoom: 17
  });
  var card = document.getElementById('pac-card');
  var input = document.getElementById('pac-input');

  var autocomplete = new google.maps.places.Autocomplete(input);

  // Bind the map's bounds (viewport) property to the autocomplete object,
  // so that the autocomplete requests use the current map bounds for the
  // bounds option in the request.
  autocomplete.bindTo('bounds', map);

  // Set the data fields to return when the user selects a place.
  autocomplete.setFields(
    ['address_components', 'geometry', 'icon', 'name']);

  var infowindow = new google.maps.InfoWindow();
  var infowindowContent = document.getElementById('infowindow-content');
  infowindow.setContent(infowindowContent);
  var marker = new google.maps.Marker({ position: hawker, map: map });
  // var marker = new google.maps.Marker({
  //   map: map,
  //   anchorPoint: new google.maps.Point(0, -29)
  // });

  autocomplete.addListener('place_changed', function () {
    infowindow.close();
    marker.setVisible(false);
    var place = autocomplete.getPlace();
    var lat = place.geometry.location.lat();
    var lng = place.geometry.location.lng();
    var address = place.address_components;
    var addressString = "";
    if (address[0] != undefined) {
      var address1 = address[0].long_name;
      addressString = addressString + address1;
    }
    if (address[1] != undefined) {
      var address2 = address[1].long_name;
      addressString = addressString + ", " + address2;
    }
    if (address[3] != undefined) {
      var address3 = address[3].long_name;
      addressString = addressString + ", " + address3;
    }
    if (address[5] != undefined) {
      var address4 = address[5].long_name;
      addressString = addressString + ", " + address4;
    }

    console.log("formatted address: ");
    console.log(addressString);
    if (!place.geometry) {
      // User entered the name of a Place that was not suggested and
      // pressed the Enter key, or the Place Details request failed.
      window.alert("No details available for input: '" + place.name + "'");
      return;
    }

    document.getElementById("lat").value = lat;
    document.getElementById("lng").value = lng;
    document.getElementById("pac-input").value = addressString;

    // If the place has a geometry, then present it on a map.
    if (place.geometry.viewport) {
      map.fitBounds(place.geometry.viewport);
    } else {
      map.setCenter(place.geometry.location);
      map.setZoom(17);  // Why 17? Because it looks good.
    }
    marker.setPosition(place.geometry.location);
    marker.setVisible(true);
    console.log(lat);
    console.log(lng);

    var address = '';
    if (place.address_components) {
      address = [
        (place.address_components[0] && place.address_components[0].short_name || ''),
        (place.address_components[1] && place.address_components[1].short_name || ''),
        (place.address_components[2] && place.address_components[2].short_name || '')
      ].join(' ');
    }

    infowindowContent.children['place-icon'].src = place.icon;
    infowindowContent.children['place-name'].textContent = place.name;
    infowindowContent.children['place-address'].textContent = address;
    infowindow.open(map, marker);
  });
}



function remove_image_fields() {
  console.log(this);
  let parent = this.parentNode.parentNode;
  console.log(parent);
  console.log(parent.childNodes[1]);
  parent.childNodes[1].value = "1";
  parent.hidden = true;
}

function add_image_fields() {
  console.log(this);
  let parent = this.parentNode;
  let last = parent.childNodes.length - 2
  let secondLast = parent.childNodes.length - 4;
  let thirdLast = parent.childNodes.length - 6;

  let newImageFieldID = parent.childNodes[secondLast].cloneNode(true);
  let newImageField = parent.childNodes[thirdLast].cloneNode(true);

  //populating newImageFieldID with new values

  currentIdTag = newImageFieldID.id.split("_")[3];
  newIdTag = parseInt(currentIdTag) + 1;

  newImageFieldID.name = "hawker[images_attributes][" + newIdTag + "][id]";
  newImageFieldID.id = "hawker_images_attributes_" + newIdTag + "_id";
  let newIdValue = new Date().getTime();
  newImageFieldID.value = newIdValue;

  //done populating newImageFieldID with new values
  //begin populating newImageField with new values
  let firstInputField = newImageField.childNodes[1];
  firstInputField.name = "hawker[images_attributes][" + newIdTag + "][_destroy]";
  firstInputField.id = "hawker_images_attributes_" + newIdTag + "__destroy";
  let secondInputField = newImageField.childNodes[3];
  secondInputField.setAttribute("for", "hawker_images_attributes_" + newIdTag + "_image_url");
  let thirdInputField = newImageField.childNodes[5];
  let thirdInputField1 = thirdInputField.childNodes[1]
  thirdInputField1.setAttribute("value", "");
  thirdInputField1.setAttribute("name", "hawker[images_attributes][" + newIdTag + "][image_url]");
  thirdInputField1.setAttribute("id", "hawker_images_attributes_" + newIdTag + "_image_url");
  let thirdInputFieldButton = thirdInputField.childNodes[3];
  thirdInputFieldButton.addEventListener("click", remove_image_fields)


  //done populating newImageField with new values

  parent.insertBefore(newImageField, parent.childNodes[last]);
  parent.insertBefore(newImageFieldID, parent.childNodes[last]);

  console.log(thirdInputFieldButton);
}

function attachEventListeners() {
  let removeImageButtons = document.getElementsByClassName('remove-image-field');
  for (let i = 0; i < removeImageButtons.length; i++) {
    const button = removeImageButtons[i];
    button.addEventListener("click", remove_image_fields);
  }
  let addImageButton = document.getElementById("add-image-field-button");
  addImageButton.addEventListener("click", add_image_fields);
}
window.onload = attachEventListeners;