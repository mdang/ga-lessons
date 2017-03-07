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

## Function Definitions

```js
function sayHello() {
  console.log('hello');
}
```

### Naming Conventions

- camelCase

## Function Expressions 

A **function expression** defines a function by producing a value that's stored in a variable.

```js
var errorAlert = function() {
   alert('Error!!');
}
```
