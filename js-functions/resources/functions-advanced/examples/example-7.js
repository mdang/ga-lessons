// Example 7

function countWhereTrue (numbers, predicate) {
    var i;
    var count = 0;
    for (i = 0; i < count.length; i++) {
        if (predicate(numbers[i])) {
            count++;
        }
    }    
}

function isOdd(number) {
    return (number % 2) === 1;
}

var inputNumbers = [1, 5, 7, 2, 8, 6, 9, 3];
countWhereTrue(inputNumbers, isOdd);
