document.querySelector('a').addEventListener('click', addAnchorMessage);
document.querySelector('li').addEventListener('click', addLiMessage);
document.querySelector('ul').addEventListener('click', addUlMessage);
document.querySelector('body').addEventListener('click', addBodyMessage);
document.addEventListener('click', addDocumentMessage);

function addAnchorMessage (e) {
	e.preventDefault();
	// Uncomment below line to prevent bubbling
	// e.stopPropagation();
	console.log('Anchor has been clicked');
}

function addLiMessage () {
	console.log('List item has been clicked');
}

function addUlMessage () {
	console.log('Unordered list has been clicked');
}

function addBodyMessage () {
	console.log('Body has been clicked');
}

function addDocumentMessage () {
	console.log('Unordered list has been clicked');
}
