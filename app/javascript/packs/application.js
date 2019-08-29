import "bootstrap";
import 'mapbox-gl/dist/mapbox-gl.css';
import { placesAutocomplete } from '../add-ons/places'
import { initMapbox } from '../plugins/init_mapbox';

initMapbox();
// import "swing/examples/card-stack/card-stack.css";

placesAutocomplete();
