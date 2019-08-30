import places from 'places.js'

const placesAutocomplete = (id, key) => {
  const addressInput = document.querySelector('#address-input');
  const reconfigurableOptions = {
    type: 'city',
    aroundLatLngViaIP: false // Search only for cities names
  };
  if (addressInput) {
    places({ appId: id,
              apiKey: key,
              container: addressInput,
               }).configure(reconfigurableOptions);;
  }
};

export { placesAutocomplete }
