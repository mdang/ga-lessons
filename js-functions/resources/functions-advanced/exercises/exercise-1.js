// Exercise 1: Javascript Functions are First Class

// Here is example code from the lesson.

// Example 7:

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

// Rewrite the predicate isEven so that the following code works.
// Note that this, like the example above, is using a named function.

function isEven (number) {
  return false;
}

if (countWhereTrue(inputNumbers, isEven) === 3) {
  console.log('isEven predicate works correctly');
} else {
  console.log('isEven predicate does not work correctly');
}

