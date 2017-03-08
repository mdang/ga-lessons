// Select all the list items on the page
var switcherButtons = document.querySelectorAll('li');

// Add an event handler to each list item that will run the 
// switchTheme function when the list item is clicked
for (var i = 0; i < switcherButtons.length; i++) {
	switcherButtons[i].addEventListener('click', switchTheme);
}

function switchTheme () {
	// Step 1: Get the class name from the button that was just clicked 
	// And store in variable newTheme 
		// Hint #1: use the this keyword here
		// Hint #2: You'll want to use the className property.

	// Step 2: Change the class on the body to the class stored in the newTheme variable.
		// Hint #1: You'll want to use the className property.

}