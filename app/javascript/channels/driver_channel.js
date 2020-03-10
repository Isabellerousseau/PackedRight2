import createChannel from "./cable"
import { showNotificationToDom } from '../plugins/driver_notifications'

const initDriverChannel = () => {
  console.log('stqrting')
  const driverBox = document.querySelector('#driver-box')

  if (messageBox) {
    console.log('connected')
    createChannel(
      { channel: "DriverChannel", driver_id: messageBox.dataset.driverId },
      {
        received({ message }) {
          console.log('got notificqtion')
          showNotificationToDom(message)
        }
      }
    )
  }
}
export { initDriverChannel }
