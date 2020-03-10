import createChannel from "./cable"
import { showNotificationToDom } from '../plugins/driver_notifications'

const initDriverChannel = () => {
  console.log('stqrting')
  const driverBox = document.querySelector('#driver-box')

  if (driverBox) {
    console.log('connected')
    createChannel(
      { channel: "DriverChannel", driver_id: driverBox.dataset.driverId },
      {
        received({ message }) {
          showNotificationToDom(message)
        }
      }
    )
  }
}
export { initDriverChannel }
