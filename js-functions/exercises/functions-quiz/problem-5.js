Several months later that very same intern comes to you with some code he wrote that he says is useful in sorting. It looks like this:

var asStringAscending = function(a, b) {
    if (a.toUpperCase() < b.toUpperCase()) {
        return -1;
    } else if (a.toUpperCase() > b.toUpperCase()) {
        return 1;
    } else {
        return 0;
    }
};

var asNumberDescending = function(a, b) {
    if (Number(a) < Number(b)) {
        return -1;
    } else if  (Number(a) > Number(b)) {
        return 1;
    } else {
        return 0;
    }
};

You're busy and you nod and smile and save it to look at later.

Now you've a bunch of statistical analysis code to write, and it's all sorting.  You're going to need something like this to sort a list of numbers.

THe intern had a list of numbers to test:

var randomList = [9, 12, 4, 7, 2, 3, 6, 0, 5, 11, 14, 1, 8, 10, 13];

When you said

randomList.sort();
you got
[ 0, 1, 10, 11, 12, 13, 14, 2, 3, 4, 5, 6, 7, 8, 9 ]

which is not at all what you wanted.

The array.sort() method can take a function as a parameter.  Can you use one of the intern's functions above as an argument to sort to produce the answer you want?

(an earlier thougt started with this:)

var makeComparator = function(transform, descending) {
    return function (a, b) {
        var normalA = transform(a);
        var normalB -= transform(b);
        var ascendingResult;

        if (normalA < normalB) {
            ascendingResult = -1;
        } else if (normalB < normalA) {
            ascendingResult = 1;
        } else {
            return 0;
        }

        var descendingResult = ascendingResult * -1;

        return descending ? descendingResult : ascendingResult;
    };
};

