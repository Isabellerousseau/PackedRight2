import { updateDriverOnMap } from './init_mapbox'

const updateDriverCoords = ({ coords }) => {
  const { latitude, longitude } = coords
  // the line above is equal to
  // const latitude = coords.latitude
  // const longitude = coords.longitude
  const driverId = document.querySelector('#map').dataset.driverId

  fetch(`/api/v1/drivers/${driverId}`, {
    method: 'PATCH',
    headers: {
      'Content-type': 'application/json'
    },
    body: JSON.stringify({
      driver: {
        latitude,
        longitude
      }
    })
  })
    .then(res => res.json())
    .then(data => {
      updateDriverOnMap(data)
    })
}

const error = (err) => {
  console.warn('ERROR(' + err.code + '): ' + err.message);
}

const followDriver = () => {
  let id, options;

  options = {
    enableHighAccuracy: false,
    timeout: 5000000000,
    maximumAge: 0
  };

  id = navigator.geolocation.watchPosition(updateDriverCoords, error, options);
}


export { followDriver }
