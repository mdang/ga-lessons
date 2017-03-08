// Let's set up a function that will be triggered when the event occurs.
var alertUser = function () {
  alert('Button has been clicked!');
}

// Next let's find the element we want to tie
//the event to and save it to a variable.
var button = document.querySelector('button');

// Finally let's set up an event handler.
// When the user clicks on the button,
// the alertUser function will run.
button.addEventListener('click', alertUser);