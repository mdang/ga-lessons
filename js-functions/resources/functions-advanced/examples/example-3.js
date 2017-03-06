// Example 3

function announce() { 
    console.log('Ding!'); 
}

var threeSecondTimeout = setTimeout (announce, 3000);

var fiveSecondTimeout = setTimeout (function () { 
    console.log('Ding!'); 
}, 5000);
