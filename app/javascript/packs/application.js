import "bootstrap";
import "swing";
import 'mapbox-gl/dist/mapbox-gl.css';
import { placesAutocomplete } from '../add-ons/places'
import { initMapbox } from '../plugins/init_mapbox';
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();

initMapbox();
// import "swing/examples/card-stack/card-stack.css";

placesAutocomplete(process.env.YOUR_PLACES_APP_ID, process.env.YOUR_PLACES_API_KEY);

