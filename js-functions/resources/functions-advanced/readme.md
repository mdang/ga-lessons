![General Assembly Logo](http://i.imgur.com/ke8USTq.png)

# Javascript Objects are First-Class

## Introduction

One of the things that makes Javascript such a powerful language is
that in jargon, "functions are first-class objects."  This means that
you can do the same things with functions that you can do with any
other value: you can store them in variables, you can pass them as
arguments to other functions, and return them from other functions.
Today, we're going to be exploring those capabilities.

## Objectives

By the end of this lesson, students should be able to do the
following:

- Store and use anonymous functions in variables
- Pass functions as arguments to functions that expect them
- Write functions that take other functions as arguments
- Return functions from functions

## What's in a name?

You've seen functions like this one already:

```javascript
// Example 1

function square(x) {
    return x*x;
}
```

This function has a name: `square`.

But we could have defined it another way:

```javascript
// Example 2

var square = function (x) {
    return x*x;
};
```

Example 1 is called the "function definition" or "function
declaration" form.  Example 2 is called the "function expression"
form.  By convention, the function declaration form does not require a
semicolon after it, while the function expression form does.

A key thing to remember: when you want to refer to the function itself
-- for example, when you want to pass it to another function (which
we'll see in a moment) or when you want to assign it to a variable,
you use the function name *without parentheses*.  When you want to
invoke or call the function, you use the function name *with
parentheses*.

And a key thing to be careful of: the observant among you will have
noticed that there are two places you can give a function a name.
There are almost no circumstances where it is a good idea to do this.

Something to be careful of: the observant among you will have noticed
that there are two places that you can give a function a name.  For
now: never use both, always use one or the other.

But what can we do with this?

## Do something later: callbacks

The `setTimeout()` function takes a function and a delay in
milliseconds, and executes the function as soon as possible after that
delay has passed.

```javascript
// Example 3

function announce() { 
    console.log('Ding!'); 
}

var threeSecondTimeout = setTimeout (announce, 3000);

var fiveSecondTimeout = setTimeout (function () { 
    console.log('Ding!'); 
}, 5000);
```

The `setInterval()` function takes a function and a delay in
milliseconds, and executes that function as closely as possible each
time that interval of milliseconds has passed.

```javascript 
// Example 4

function annoy(){ 
    console.log('Are we there yet?');
}

var threeSecondInterval = setInterval(annoy, 3000);

var fiveSecondInterval = setInterval(function (){
    console.log("I'm bored!");
}, 5000);
```

Things to be careful of:  you need to know what the function expects
as parameters.  Javascript is forgiving, but not a mind-reader.

Oh, and if you want to disable the timers before they fire, you can
use the `clearTimeout(timeoutHandle)` or
`clearInterval(intervalHandle)` functions:

```javascript
// Example 5

var fourSecondTimeout = setTimeout (announce, 4000);
clearTimeout(fourSecondTimeout);

clearInterval(threeSecondInterval);
clearInterval(fiveSecondInterval);
```

## I'll handle the big picture, you handle the details

There are a lot of problems that can be broken down into two or more
smaller, easier problems.  We're going to start with a fairly simple
but artifical one:

```javascript
// Example 6

function countOdds (numbers) {
    var i;
    var count = 0;
    for (i = 0; i < count.length; i++) {
        if (numbers[i] %2 === 1) {
            count++;
        }
    }
}

var inputNumbers = [1, 5, 7, 2, 8, 6, 9, 3];
countOdds(inputNumbers);
```

This is two problems: one, iterating over the list and counting items,
and two, determining whether the item should be counted.  So we can
rewrite it like this:

```javascript
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
```

Notice that `countWhereTrue()` relies on the predicate taking one
argument, a number, and returning a truthy or falsy value.  If the
predicate doesn't do that, all bets are off.  This is sometimes called
a "software contract."

## Try it for yourself

Work through the problems in exercises/exercise-1.js,
exercises/exercise-2.js, and exercises/exercise-3.js.

## Returning functions from functions

You can probably guess by now how to return a function from a
function:

```javascript
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
```

Or we can use this feature to simplify what we've learned and pretend
we lived in a simpler time:

```javascript
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
```

There is a lot of complexity hidden underneath the surface here, most
of it dealing with scoping.  We'll be coming back to re-examine this
later.

## Try it for yourself

Work through the problems in exercises/exercise-4.js and
exercises/exercise-5.js

## Other Notes

All of the examples are available as separate files in the examples/
directory.