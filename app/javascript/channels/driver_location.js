import consumer from "./consumer"
import { addLocationToDom } from '../plugins/location'

const initDriverLocationChannel = () => {
  const driverLocation = document.querySelector('??LATITUDE??LONGITUDE??')
  if (driverLocation) {
    const driver = locationBox.dataset.driverId
    marker.newLocation(location) // This will move the marker to the new location

    consumer.subscriptions.create({
      channel: "DriverLocationChannel",
      driver_id: driver
    }, {
      connected() {
        console.log('Connected...')
      },
      received({ location }) {
        console.log('Receiving location...')
        addLocationToDom(location)
      }
    })
  }
}

export { initDriverLocationChannel }
