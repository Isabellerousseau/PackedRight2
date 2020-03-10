const showNotificationToDom = (notification) => {
  console.log('got it')
  const modal = document.querySelector('#driver_modal')
  modal.querySelector('.modal-body').innerHTML = `<p>${message.content}</p>`
  $('#modalbtn').click()
}

export { showNotificationToDom }
