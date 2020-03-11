export const orderDelivered = () => {



  const button = document.querySelector('#delivered-btn')

  if (button) {
    button.addEventListener('click', () => {

      console.log(button.dataset)
      // fetch(`/api/v1/drivers/${orderId}`, {
      //   method: 'PATCH',
      //   headers: {
      //     'Content-type': 'application/json'
      //   },
      //   body: JSON.stringify({
      //     driver: {
      //       latitude,
      //       longitude
      //     }
      //   })
      // })
      // .then(res => res.json())
      // .then(data => {
      //   updateDriverOnMap(data)
      // })
    })
  }
}

