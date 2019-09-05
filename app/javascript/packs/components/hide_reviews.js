const hideReviews = () => {
  var hideBtn = document.getElementById("show-reviews");
  if (hideBtn) {
    var hiddenReviews = document.querySelectorAll(".to-hide");
    hideBtn.addEventListener("click", (event) => {
      if (hiddenReviews[0].classList.contains("hide")) {
        hideBtn.innerText = "Show less";
      } else {
        hideBtn.innerText = "Show more";
      }
      hiddenReviews.forEach((review) => {
        review.classList.toggle("hide");
      });
    });
  }
}

export { hideReviews }
