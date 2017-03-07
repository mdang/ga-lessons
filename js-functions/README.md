# Functions

### Learning Objectives

- Explain what functions are and why they are useful in a program
- Describe what arguments and parameters are, and their importance to functions
- Describe the role of the `return` keyword and its importance to functions
- Call a named function and store the return value in a variable
- Describe what an anonymous function is and when you would use one
- Explain the difference between referencing and invoking a function
- Explain what a first class function is, and its implications for programming in Javascript
- Explain the concept of a 'callback' and how we can pass functions as arguments to other functions
- Explain variable scoping rules in JavaScript

## What is a Function? 

- A function can be thought of as a program within a larger program. They often perform small or repetitive tasks.
- 'Function' is a term that comes out of mathematics. The basic idea of a function is simple — it's a relationship between a set of inputs and a set of outputs

## Benefits

**Code Reuse** - "Don't Repeat Yourself" (DRY) is a principle of coding - keep your programs DRY! Reusing code makes it easier to change how your program works, since you only have to make updates in one place. If you find yourself writing the same code two or more times, a good rule of thumb is to move it into a function!

Functions are especially useful because they enable a developer to segment large, unwieldy applications into smaller, more manageable pieces.

## Function Declarations

```js
function sayHello() {
  console.log('hello');
}
```

> Function declarations are also referred to as **named functions**

### Naming Conventions

- camelCase

### Invoking Functions

```js
sayHello()
```

## Function Expressions 

A **function expression** defines a function by producing a value that's stored in a variable.

```js
var errorAlert = function() {
   alert('Error!!');
}
```

> Function expressions are also referred to as assigning **anonymous functions** to variables

## Arguments and Parameters

```js
// Bad
var area = function () {
  var width = 5;
  var length = 3;
  console.log(width * length);
}

area();

// Good
var area = function (width, height) {
  console.log(width * length);
}

area(5, 3);
```

## Function Declarations vs Function Expressions

In JS, function declarations are always moved, or **hoisted**, to the top of their scope by the interpreter.

In other words, you can call a function declaration before defining it, which is **not** the case with function expressions.

## Return Statements

The return statement stops the execution of a function and returns a value from that function.

```js
// Here this function "spits out" the sum of the parameters x and y
var sum = function (x, y) {
  return x + y;
}

// We then save that sum to the variable totalSum.
var totalSum = sum(3, 4);
=> 7
// The variable totalSum will now hold the value 7.
```

### Storing Return Values in Variables

```js
function addBonusPoints (score) {
    if (score > 50) {
        return score + (score * .10);
                // if score is 50, then 60.5 will be returned
    }

    return score;
}

var totalPoints = addBonusPoints(55);
// The variable totalPoints will now hold 60.5
```

### Exiting a Function

We can also use the `return` statement to end function execution.

```js
var rockAndRoll = function (muted) {
   var song = "It's only Rock 'N' Roll";
   var artist = "Rolling Stones";

   if (muted === true) {
       return; // Here we use return as a way to exit a function, instead of returning any value
   }

    console.log("Now playing: " + song + " by " + artist);
}

rockAndRoll(true);
```

## Scope

The variable scope describes where in a program a variable can be seen. In other words, where it can be used.

A variable that is declared outside a function definition is a **global** variable, and its value is accessible and modifiable throughout your program. A variable that is declared inside a function definition is **local**.

Scope has to do with where identifiers are defined (not where they are executed). This is why JavaScript is said to have lexical scope, which essentially means you can see where variables are defined within code and know the scope of the variable.

**Rules of scope**: 

- Anytime a function is declared, a new scope is created
- Inner scopes can see outward, but outward scopes cannot see inward
- Scopes can be nested within one another
- When looking for an identifier, JS starts in the most immediate scope, and moves outward until it finds something
- When creating a variable without the `var` keyword, that variable's scope is global
- When using the `var` keyword to declare a variable, that variable's scope is the local scope where it was declared
- Arguments to functions become a part of that function's local scope
- When a variable is declared **outside a function**, it is referred to as a **global variable**. A global variable has global scope, which means *all scripts and functions on a web page can access it*

### Memory Usage

Another difference between global and local variables is the use of memory.

Every variable takes up memory. The more memory our script requires, the slower our web page.

#### Local Variables

The interpreter creates local variables when it runs a function and removes them right after that function finishes running.

#### Global Variables

Global variables, on the other hand, are stored in the processor's memory for as long as the page is loaded in the browser. As a result, global variables can be inefficient, because they will continue to take up memory space even when they are not actually in use.

It's very possible to have naming conflicts with global variables.
