const pullMessages = () => {
  setInterval(makeRequest, 2000)
}

const makeRequest = () => {
  console.log('Pulling messages...')

  const list = document.querySelector('#message-list')
  const orderId = list.dataset.orderId

  fetch(`/api/v1/orders/${orderId}/messages`)
    .then(response => response.json())
    .then(messages => {
      const html = messages.map(message => `<li> ${message.content} </li>`).join('')

      list.innerHTML = html
      console.log(messages)
    })
}

export { pullMessages }
