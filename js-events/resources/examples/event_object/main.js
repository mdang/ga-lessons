document.querySelector('a').addEventListener('click', viewComments);


function viewComments (e) {
	// To access a property of the event object, we can use dot notation:
	var eventTarget = e.target;
	// Log the target to the console
	console.log(eventTarget);

	var eventType = e.type;
	console.log('The event type is: ' + eventType);

	// Prevent page from jumping to top.
	e.preventDefault();

	document.querySelector('#comments').className = 'show-comments';
}