// // SINGLE CIRCLE
// document.querySelector('.circle').addEventListener('click', turnRed)

// function turnRed () {
// 	this.style.backgroundColor = "red";
// }


// MULTIPLE CIRCLES
//Select all elements with the class .circle on the page
var circles = document.querySelectorAll('.circle');
 
//loop through each .circle element and add an event handler.
for (var i = 0; i < circles.length; i++) {
circles[i].addEventListener('click', turnRed);
}
 
function turnRed () {
this.style.backgroundColor = "red";
}
 
