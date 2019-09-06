import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";

const initStarRating = () => {
  $('.activity-review-select').barrating({
    theme: 'css-stars',
    onSelect: function(value, text, event) {
    // We are selecting the form on the page with its class
      // event.currentTarget.closest('form').submit(); // We submit the form with javascript

    }
  });
  // TODO
};

export { initStarRating };
