// Exercise 4: Javascript Functions are First Class

// Here are the function generators from the lesson:

// Example 8

function makeIncrementor(n) {
    return function (x) {
        return x + n;
    };
}

var plusOne = makeIncrementor(1);
var plusTwo = makeIncrementor(2);

plusOne(6);
plusTwo(4);

// Write a function generator to make the following code work correctly:

function makeMultiplicator(n) {
  // your code inside this function
}

var timesThree = makeMultiplicator(3);
var timesNine = makeMultiplicator(9);

if (timesThree !== undefined && timesThree(12) === 36) {
  console.log('the TimesThree multiplicator works');
}
if (timesNine !== undefined && timesNine(3) === 27) {
  console.log('the timesNine multiplicator works');
}

