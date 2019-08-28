import places from 'places.js'

const placesAutocomplete = () => {
  const addressInput = document.querySelector('#address-input');
  const reconfigurableOptions = {
    type: 'city',
    aroundLatLngViaIP: false // Search only for cities names
  };
  if (addressInput) {
    places({ appId: process.env.YOUR_PLACES_APP_ID,
              apiKey: process.env.YOUR_PLACES_API_KEY,
              container: addressInput,
               }).configure(reconfigurableOptions);;
  }
};

export { placesAutocomplete }
