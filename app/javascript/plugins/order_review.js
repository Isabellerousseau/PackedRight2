export const initOrderReview = () => {


  document.querySelectorAll(".see-review").forEach(item => {
    item.addEventListener("click", event => {
      event.preventDefault();

      const link = event.currentTarget;
      const review = link.nextElementSibling;
      review.classList.toggle("show");
    });
  });

}
