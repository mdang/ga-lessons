var button = document.querySelector('button');
var input = document.querySelector('input');

function handleClickEvent (evt) {
  console.log('I was clicked!')
  console.log(evt)
}
function handleKeyboardEvent (evt) {
  console.log('You used the keyboard!')
  console.log(evt)
}

button.addEventListener('click', handleClickEvent);
input.addEventListener('keyup', handleKeyboardEvent);