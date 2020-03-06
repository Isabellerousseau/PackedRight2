const MapboxDirections = require('@mapbox/mapbox-gl-directions');

const directions = new MapboxDirections({
  accessToken: 'MAPBOX_API_KEY',
  unit: 'metric',
  profile: 'mapbox/cycling'
});

const map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/mapbox/streets-v9'
});

map.addControl(directions, 'top-left');
