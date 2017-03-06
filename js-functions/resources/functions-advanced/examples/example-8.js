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
