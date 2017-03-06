// Exercise 3: Javascript Functions are First Class

// Here is example code from the lesson.

// Example 7

function countWhereTrue (numbers, predicate) {
    var i;
    var count = 0;
    for (i = 0; i < numbers.length; i++) {
        if (predicate(numbers[i])) {
            count++;
        }
    }
    return count;
}

function isOdd(number) {
    return (number % 2) === 1;
}

// And here is some code to test that the code above works correctly.

var inputNumbers = [3, 1, 6, 2, 4, 9, 7, 5];

if (countWhereTrue(inputNumbers, isOdd) === 5) {
  console.log('isOdd predicate works correctly');
} else {
  console.log('isOdd predicate does not work correctly');
}

// Modify the code below so that instead of returning the count of items
// matching the predicate, it returns an array of them.

function listWhereTrue (numbers, predicate) {

  // your code here
  return undefined;
}

var listResult = listWhereTrue(inputNumbers, isOdd);

var assert = require('assert');

try {
  assert.deepEqual(listResult, [3, 1, 9, 7, 5]);
  console.log('listWhereTrue produces the right answer!');
}
catch (e) {
  console.log('listWhereTrue is still confused.');
}

