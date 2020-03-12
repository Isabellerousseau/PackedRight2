const showNotificationToDom = (message) => {
  console.log('got it')
  const modal = document.querySelector('#driver_modal')
  modal.querySelector('.modal-body').innerHTML = `<p> <strong>Parcel:</strong> ${message.name}()</p>
        <p><strong>Pickup location:</strong> ${message.pickup}</p>
        <p><strong>Drop-off location:</strong> ${message.drop_off}</p>
        <p><strong>Is it fragile?:</strong>
          ${message.fragile}</p>`

  modal.querySelector('.modal-footer').insertAdjacentHTML('beforeend', `<a href="/orders/${message.order}" class="btn btn-primary"> GO </a>`)
  document.querySelector("#modalbtn").click()
}

export { showNotificationToDom }
