import { sendMessage } from "../channels/chat_channel"

const form = document.querySelector('#new-message-form')
const input = document.querySelector('#message_content')
const list = document.querySelector('#message-list')
const messageBox = document.querySelector('#messages-box')

let orderId

if (messageBox) {
  orderId = messageBox.dataset.orderId
}

// load all messages on pageload
const pullMessages = () => {
  if (messageBox) {
    fetch(`/api/v1/orders/${orderId}/messages`)
      .then(res => res.json())
      .then(messages => {
        messages.forEach(showMessageToDom)
      })
  }
}

// create new message
const createMessage = () => {
  if (messageBox) {
    form.addEventListener("submit", (event) => {
      event.preventDefault()

      fetch(`/api/v1/orders/${orderId}/messages`, {
        method: 'POST',
        headers: {
          'Content-type': 'application/json'
        },
        body: JSON.stringify({
          message: {
            content: input.value
            // We are using value here to access the input
          }
        })
      })
        .then(() => {
          form.querySelector('#submit-btn').disabled = false
          input.value = ""
        })
    });
  }
}

// function called by actioncable when a message is created
const showMessageToDom = (message) => {
  const list = document.querySelector('#message-list')
  list.insertAdjacentHTML('beforeend', `<li> ${message.content} </li>`)
}

const deleteMessage = () => {
  const list = document.querySelector('#message-list')

  if (list) {
    const orderId = list.dataset.orderId
    document.addEventListener('click', (event) => {
      if (event.target && event.target.classList.contains('delete-btn')) {
        // /api/v1/orders/:order_id/messages/:message_id
        fetch(`/api/v1/orders/${orderId}/messages/${event.target.dataset.messageId}`, {
          method: 'DELETE'
        })
        .then(response => input.value = "")
      }
    })
  }
}

export { pullMessages, createMessage, deleteMessage, showMessageToDom }


