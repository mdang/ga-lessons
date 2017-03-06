# JavaScript Functions Examples

### Average

```javascript
// find the average of two numbers 
function average(x, y) {
  return (x + y) / 2; 
}

 // calling the function 
var y = average(20, 40); 
console.log("y = " + y);  // will print "y = 30"
```

## The Return Statement

The ***return*** statement ends the execution of the function and (optionally) returns a value to the caller.

### Example #2

```javascript
// return the first object in the array that has the specified id.
function findById(arr, id) {
  for (var i = 0; i < arr.length; i++) {
    if (arr[i].id === id) {
      return arr[i];
    }
  }
  return null;      // why do we need this?
}
```

### Example #3

```javascript
// calculate income tax
function getTax(income) {
  if (income < 50000) {
    return income * 0.15;
  }
  else if (income < 100000) {
    return income * 0.20;
  }
  else {
    return income * 0.25;
  }
}

// calling the function
console.log("Tax on 40000 = " + getTax(40000));
console.log("Tax on 80000 = " + getTax(80000));
console.log("Tax on 120000 = " + getTax(120000));
```


## Function Declarations

### Example #4

```javascript
// simple function declaration 
function square(x) {
  return x * x;
}

// function assigned to a variable
 var square = function(x) {
  return x * x;
};

// functions as properties of an Object 
var mathHelpers = { 
  square: function(x) {
    return x * x;
  },
  average: function(x, y) { 
    return (x + y) / 2; 
  }
 };

// invoking a "method"
var y = mathHelpers.square(3);
```


## Anonymous Functions

### Example #5

```javascript
function foo() {
  // This is a named function...
}

function() {
  // This is an anonymous function...
}
```


## Scope

### Example #6

```javascript
var president = "Everyone knows me. Globally!";

function town() {
  var mayor = "I'm unknown outside of my township.";

  function house() {
    var homebody = "No one knows me. " +
      "I don't leave home. " +
      "but I know the mayor and the president.";
  }

  evilDictator = "I am evil! Want to know why?";
}
```


## Functions: Hoisting

### Example #7

```javascript
// What we wrote
function add(x, y) {
  x = x || 0;
  y = y || 0;
  var sum = x + y;
  return sum;
}

// What gets executed
function add(x, y) {
  var sum;
  x = x || 0;
  y = y || 0;
  sum = x + y;
  return sum;
}
```
