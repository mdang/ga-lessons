var switcherButtons = document.querySelectorAll('li');

for (var i = 0; i < switcherButtons.length; i++) {
	switcherButtons[i].addEventListener('click', switchTheme);
}

function switchTheme () {
	var newTheme = this.className;
	document.querySelector('body').className = newTheme;
}