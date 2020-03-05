const pullMessages = () => {
  setInterval(makeRequest, 2000)
}

const createMessage = () => {
  const form = document.querySelector('#new-message-form')
  const input = document.querySelector('#message_content')
  const list = document.querySelector('#message-list')

  const orderId = list.dataset.orderId

  form.addEventListener("submit", (event) => {
    // Do something (callback)
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
    .then(response => input.value = "")
  });
}

const deleteMessage = () => {
  const list = document.querySelector('#message-list')
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

const makeRequest = () => {
  const list = document.querySelector('#message-list')
  const orderId = list.dataset.orderId

  fetch(`/api/v1/orders/${orderId}/messages`)
  .then(response => response.json())
  .then(messages => {
    const html = messages.map(message => `<li> ${message.content} <button data-message-id="${message.id}" class="btn delete-btn btn-danger"> Delete </button></li>`).join('')
    list.innerHTML = html
  })
}

export { pullMessages, createMessage, deleteMessage }
