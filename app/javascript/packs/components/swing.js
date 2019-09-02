import "swing"

window.swing = require('swing');
// Prepare the cards in the stack for iteration.
const cards = [].slice.call(document.querySelectorAll('#activity-list > li'));

const config = {

   // * Invoked in the event of dragmove.
   // * Returns a value between 0 and 1 indicating the completeness of the throw out condition.
   // * Ration of the absolute distance from the original card position and element width.

   // @param {number} xOffset
   // @param {number} yOffset
   // @param {HTMLElement} element Element.
   // @returns {number}



  // minThrowOutDistance: 1,
  throwOutConfidence: (xOffset, yOffset, element) => {

    const xConfidence = Math.min(Math.abs(xOffset) / (element.offsetWidth / 2), 1);
    const yConfidence = Math.min(Math.abs(yOffset) / (element.offsetHeight / 2), 1);

    return Math.max(xConfidence, yConfidence);
  }

};
// An instance of the Stack is used to attach event listeners.
const stack = swing = swing.Stack(config);

cards.forEach((targetElement) => {
  // Add card element to the Stack.
  stack.createCard(targetElement);
});

// Add event listener for when a card is thrown out of the stack.
stack.on('throwout', (event) => {
  // e.target Reference to the element that has been thrown out of the stack.
  // e.throwDirection Direction in which the element has been thrown (Direction.LEFT, Direction.RIGHT).

  console.log('Card has been thrown out of the stack.');
  // console.log('Throw direction: ' + (event.throwDirection == Direction.LEFT ? 'left' : 'right'));
});

// Add event listener for when a card is thrown in the stack, including the spring back into place effect.
stack.on('throwin', () => {
  console.log('Card has snapped back to the stack.');
});

const thumbsUp = document.getElementById('thumbs_up_btn');
const thumbsDwn = document.getElementById('thumbs_dwn_btn');
thumbsUp.addEventListener('click', (event) => {
  thumbsDwn.disabled = true;
  thumbsUp.disabled = true;
  const updatedCards = document.querySelectorAll('#activity-list > li'); // getting the list of the cards that remain
  const currentCard = updatedCards[updatedCards.length - 1]; // getting the last card which is the current one
  const cardId = parseInt(currentCard.getAttribute('data-id'), 10); // getting the activity id from the data-id stored in each card
  const planTrip = document.getElementById('plan_trip_link'); // getting the link that will redirect to trips#create action
  if (/\&cardIds/.exec(planTrip.getAttribute('href'))) { // if we already had some ids in the link
    planTrip.href += `,${cardId}`; // just add the id of the new card
  } else {
    planTrip.href += `&cardIds=${cardId}`; // add the param with the value if no ids were previously added
  }
  currentCard.classList.add('swiped-right');
  setTimeout(() => {
    currentCard.remove();
    thumbsDwn.disabled = false;
    thumbsUp.disabled = false;
  }, 800);

});

stack.on('throwout', (event) => {
  const updatedCards = document.querySelectorAll('#activity-list > li'); // getting the list of the cards that remain
  const currentCard = updatedCards[updatedCards.length - 1]; // getting the last card which is the current one
  const cardId = parseInt(currentCard.getAttribute('data-id'), 10); // getting the activity id from the data-id stored in each card
  const planTrip = document.getElementById('plan_trip_link'); // getting the link that will redirect to trips#create action
  const activityShowLinks = document.querySelectorAll('.activity-show-link');
  if (event.throwDirection.toString() === Symbol('RIGHT').toString()) {
    if (/\&cardIds/.exec(planTrip.getAttribute('href'))) { // if we already had some ids in the link
      planTrip.href += `,${cardId}`; // just add the id of the new card
      activityShowLinks.forEach((link) => {
        link.href += `,${cardId}`;
      });
    } else {
      planTrip.href += `&cardIds=${cardId}`; // add the param with the value if no ids were previously added
      activityShowLinks.forEach((link) => {
        link.href += `&cardIds=${cardId}`;
      });
    }
    event.target.remove(); // removing card after card is swiped to the right
  }
});


thumbsDwn.addEventListener('click', (event) => {
  thumbsDwn.disabled = true;
  thumbsUp.disabled = true;

  const updatedCards = document.querySelectorAll('#activity-list > li'); // getting the list of the cards that remain
  const currentCard = updatedCards[updatedCards.length - 1]; // getting the last card which is the current one


  currentCard.classList.add('swiped-left');
  setTimeout(() => {
  currentCard.remove()
    thumbsDwn.disabled = false;
    thumbsUp.disabled = false;
  }, 800);
});



// const btn = document.getElementById("plan_trip_link");
// // btn.disabled = true;

// const icon = document.getElementById("thumbs_up_btn");
// icon.addEventListener("click", (event) => {
//   btn.disabled = false;
// });
