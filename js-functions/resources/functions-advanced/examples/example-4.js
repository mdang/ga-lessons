// Example 4

function annoy(){ 
    console.log('Are we there yet?');
}

var threeSecondInterval = setInterval(annoy, 3000);

var fiveSecondInterval = setInterval(function (){
    console.log("I'm bored!");
}, 5000);
