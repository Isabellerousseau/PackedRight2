import createChannel from "./cable"
import { showMessageToDom } from '../plugins/messages'

const initChatChannel = () => {
  const messageBox = document.querySelector('#messages-box')

  if (messageBox) {
    createChannel(
      { channel: "ChatChannel", order_id: messageBox.dataset.orderId },
      {
        received({ message }) {
          if (message.content === 'Package delivered') {
            const isDriver = messageBox.dataset.isDriver === 'true'
            if (isDriver) {
              window.location.replace("/orders")
            }
          } else {
            showMessageToDom(message)
          }
        }
      }
    )
  }
}

export { initChatChannel }
