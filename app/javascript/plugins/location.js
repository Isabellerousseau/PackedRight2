//ActionCable.server.broadcast 'driver_locations_channel', { latitude: 'NEW_LATITUDE', longitude: 'NEW_LONGITUDE' }

const locationBox = document.querySelector('??LATITUDE??LONGITUDE??')

const fetchLocation = async () => {
  const locationBox = document.querySelector('??LATITUDE??LONGITUDE??')
  if (locationBox) {
    const driverId = locationBox.dataset.driverId

    const res = await fetch(`/api/v1/drivers/${driverId}/locations`)
    const location = await res.json()

    locations.forEach(location => addLocationToDom(location))
  }
}

const newLocation = () => {
  const locationBox = document.querySelector('??LATITUDE??LONGITUDE??')
  if (locationBox) {
    // const input = document.querySelector('??LATITUDE??LONGITUDE??')
    const driverId = locationBox.dataset.driverId

    // THERE WON'T BE A FORM NOR SUBMIT THOUGH? I WANT THIS TO HAPPEN AUTOMATICALLY!
    form.addEventListener('submit', (e) => {
      e.preventDefault()

      fetch(`/api/v1/drivers/${driverId}/locations`, {
        method: 'post',
        headers: { 'Content-type': 'application/json' },
        body: JSON.stringify({
          location: {
            // MAYBE CHANGE THIS TO INPUT.VALUE.FLOAT????
            latitude: input.value
            longitude: input.value
          }
        })
      })
    })
  }
}

const addLocationToDom = (location) => {
  const locationBox = document.querySelector('??LATITUDE??LONGITUDE??')
  if (locationBox) {
    locationBox.insertAdjacentHTML('beforeend', `<p> ${location.latitude} ${location.longitude} by <strong> User #${location.driver_id}</strong></p>`)
  }
}

export { fetchLocation, newLocation, addLocationToDom }




// const showLocation = (location) => {

//App.locations = App.cable.subscriptions.create("DriverLocationChannel", {
  // connected: function() {},
  //disconnected: function() {},
  //received: function(data) {
    //if (data['driver_id'] === $('#map').data('driver_id')) { // You may want to check whether you are dealing with the right map
      //if (data['latitude']) { // Don't bother updating the data if there is no latitude
        //$('#map').data(data); // Overwrite the data attributes with the latest data. Make sure the data matches what you are expecting in the map.
      //};

