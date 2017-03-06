// Exercise 5: Javascript Functions are First Class

// Here is a function generators from the lesson:

// Example 9

function makeCountWhereTrue (predicate) {
    return function(numbers) {
        var i;
        var count = 0;
        for (i = 0; i < count.length; i++) {
            if (predicate(numbers[i])) {
               count++;
            }
        }
    };
}

function isOdd(number) {
    return (number % 2) === 1;
}

// Write a function generator that takes a predicate and returns a function
// that takes a list of numbers and returns the ones that match the predicate.

function makeListWhereTrue (predicate) {
    // your code here
}

var listOdds = makeListWhereTrue(isOdd);

var listResult = listOdds(inputNumbers);
if (listOdds !== undefined && numberListsEqual(listResult, [3, 1, 9, 7, 5])) {
  console.log('listOdds produces the right answer!');
} else {
  console.log('listOdds is still confused.');
}

// The code below helps to check your answer.  You should not modify it.

function numberListsEqual(a, b) {
  if (!Array.isArray(a) || !Array.isArray(b)) {
    return false;
  }

  if (a.length != b.length) {
    return false;
  }

  if (a.filter(function(e, i){
    return (typeof e !== "number") || e !== b[i];
  }).length) {
    return false;
  }

  return true;
}
