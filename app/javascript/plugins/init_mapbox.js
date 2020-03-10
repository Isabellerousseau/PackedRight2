import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const buildMap = () => {
  const token = mapElement.dataset.mapboxApiKey;
  mapboxgl.accessToken = token;

  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    zoom: 10
  });

  return map
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.backgroundRepeat = 'no-repeat';
    element.style.width = '50px';
    element.style.height = '50px';

    new mapboxgl.Marker(element)
    .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
    });
};


const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();

  console.log(markers)

  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 3000 });
};

async function getRoute(map, start, end) {
  const accessToken = mapElement.dataset.mapboxApiKey;

  const url = `https://api.mapbox.com/directions/v5/mapbox/cycling/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${accessToken}`;

  const res = await fetch(url)
  const directions = await res.json()

  const data = directions.routes[0]
  const route = data.geometry.coordinates;

  const geojson = {
    type: 'Feature',
    properties: {},
    geometry: {
      type: 'LineString',
      coordinates: route
    }
  }

  if (map.getSource('route')) {
    map.getSource('route').setData(geojson);
  } else {
    console.log('SHowing the line')
    map.addLayer({
      id: 'route',
      type: 'line',
      source: {
        type: 'geojson',
        data: geojson
      },
      layout: {
        'line-join': 'round',
        'line-cap': 'round'
      },
      paint: {
        'line-color': '#3887be',
        'line-width': 5,
        'line-opacity': 0.75
      }
    });
  }
}

const drawRoute = (map, markers) => {
  const startObject = markers.find(marker => marker.is_start)
  const endObject = markers.find(marker => marker.is_end)

  const start = [startObject.lng, startObject.lat]
  const end = [endObject.lng, endObject.lat]

  map.on('load', function() {
    // Draw the line and add end point
    getRoute(map, start, end);
  });
}

const initMapbox = () => {
  if (mapElement) {
    const map = buildMap();
    const markers = JSON.parse(mapElement.dataset.markers);
    const showRoute = parseInt(mapElement.dataset.showRoute);

    addMarkersToMap(map, markers);
    fitMapToMarkers(map, markers);

    if (showRoute) {
      drawRoute(map, markers)
    }
  }
};

export { initMapbox };










