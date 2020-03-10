const showNotificationToDom = (message) => {
  console.log('got it')
  const modal = document.querySelector('#driver_modal')
  modal.querySelector('.modal-body').innerHTML = `<p>${message.content}</p>`

  document.querySelector("#modalbtn").click()
}

export { showNotificationToDom }
