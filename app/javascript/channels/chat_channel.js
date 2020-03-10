import createChannel from "./cable"
import { showMessageToDom } from '../plugins/messages'

const initChatChannel = () => {
  const messageBox = document.querySelector('#messages-box')

  if (messageBox) {
    console.log('connected')
    createChannel(
      { channel: "ChatChannel", order_id: messageBox.dataset.orderId },
      {
        received({ message }) {
          showMessageToDom(message)
        }
      }
    )
  }
}

export { initChatChannel }
