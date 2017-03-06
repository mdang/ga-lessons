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

var countTheOdds = makeCountWhereTrue(isOdd);
