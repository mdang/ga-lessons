# Functions as Objects

### Learning Objectives

- Explain what a first class function is, and its implications for programming in Javascript
- Explain the difference between referencing and invoking a function.
- Explain the concept of a 'callback' and how we can pass functions as arguments to other functions
- Describe how Javascript functions relate to Javascript objects
- Describe what an anonymous function is and when you would use one
- Define "variable scope" in the context of a program.
- Explain variable scoping rules in Javascript
- List some problems associated with global scope.
- Explain Javascript 'context' and what the value of the 'this' keyword refers to
- Explain what the default context of Javascript executing in the browser is.

### Review

- What is a JavaScript object? How does it differ from an array? 
- How do we initialize an object? 
- What is a property made up of? 
- What kind of values can objects contain? 
- What is the difference between a function and a method? 
- How can we access a property or method within an object? 
- Why would we ever want to use bracket notation vs dot notation? 

## Keep your code DRY using Functions

A function is a statement or a group of statements that can be called anywhere in the program so that the statements inside the function do not need to be written over and over again.

When writing functions in JavaScript, think of functions as an object, like a string or a number - this means that functions can be passed to other functions as an argument and can be used just like any other object we've been working with.

Functions are essential to write JavaScript and keep the code [DRY](https://en.wikipedia.org/wiki/Don%27t_repeat_yourself).

### Defining Functions and Calling Functions 

A function can be defined using two different syntaxes. For example, we can define a function `eat` that receives one argument in either of the following ways:

```javascript
var speak = function(words){
alert(words);
}

function speak(words){
alert(words);
}
```

The difference is subtle but important. The first function declaration is assigning an "anonymous" function to a variable. The second function declaration is a named function. The practical difference is that the named function will be processed when the code is interpreted, so the function can be called before it's defined.

No matter what syntax you use, a function always has:

- A name
- An optional list of arguments - or information to use - defined by the parenthesis before the opening curly brace
- Statements inside the function - this is the code executed every the function is called

### Calling Functions

Calling a function will execute the code defined inside this function.

Defining and calling a function is different - a function will not be called when it's defined.

You call a function by using parenthesis after the function's name `()`:

```javascript
var hello = function(){
  console.log("hello there")
}

hello();

=> hello there
```

### First Class Functions

- First class functions means we can treat functions themselves as data
    + Assigning functions to variables
    + Storing functions within data structures
- Higher order functions have the ability to pass functions as an argument to other functions, return functions
    + Passing functions as arguments to other functions (e.g. callbacks)
    + Returning functions as the value from other functions
- All functions are objects, however not all objects are functions
- Anonymous functions vs. Named functions
- Referencing vs. invoking

#### Passing a function as an argument

A function can be passed as an argument to another function:

```javascript
function sayHello(name){
	return 'hello '+ name;
}

function shout(a, foo) {
	alert(foo(a));
}

shout('world!', sayHello);
// alert box that says "hello world!"
```

### Callbacks

- Event driven programming

> **QUESTION:** What are some times in real life that we have "event driven" actions programmed into our routines?

- Callbacks are functions passed as arguments to other functions, to be executed at another time
- We frequently use callbacks when we have a process we want to run, but only at a certain time later

In class callback demos of: 

* `map()`
* `forEach()`
* `setTimeout()`
* `setInterval()`

## Class Exercise 

https://gist.github.com/mdang/82adcaa5a84bcd47da784c98e5143fa2

## Scope

The variable scope describes where in a program a variable can be seen. In other words, where it can be used. We'll see more later, but you've seen that variables declared within a function cannot be seen or used in the Global Scope.

- Why do we need scope?
    + Scope gives us the notion of encapsulation, and encapsulation leads to abstraction
    + If we had no scope, all variables and functions in our program would be accessible from anywhere, meaning that we could create a "butterfly effect" where a small change on one side of the program creates a huge error elsewhere
- Scope has to do with where identifiers are *defined* (not where they are *executed*)
- Rules of scope
    + Scopes can be nested within one another
    + Inner scopes can see outward, but outward scopes cannot see inward
    + When looking for an identifier, JS starts in the most immediate scope, and moves outward until it finds something
    + When creating a variable without the `var` keyword, that variable's scope is global
    + When using the `var` keyword to declare a variable, that variable's scope is the local scope where it was declared
    + Arguments to functions become a part of that function's local scope
    + Anytime a function is declared, a new scope is created

#### Global Scope

Before you write a line of JavaScript, you're in what we call the `Global Scope`. If we declare a variable, it's defined globally:

```javascript
var name = 'Gerry';
```

Global scope can be really confusing when you run into namespace clashes. You won't want to use global scoping for all your variables, as using global scope the right way is quite complex, but every Javascript program uses the global scope in one way or another.

#### Local scope

Local scope refers to any scope that is defined right past the global one. If you define a function, this function will have its own scope inside the body of the function. Any function defined inside another function has a also a local scope and can refer to the parent scope, but this logic doesn't work the other way around.

#### Function scope - can't get inside from outside!

A variable defined inside a function cannot be accessed outside the function, this is the scope function:

```javascript
var a = "this is the global scope";
function myFunction() {
	var b = "this variable is defined in the local scope";
}
myFunction();
alert(b);
```

This will throw a reference error because the variable `b` is not accessible outside of the scope if the function where it is defined.

#### Accessing variables in the same scope

In the logic defined above, the fact that a variable cannot be accessed by the parent scope works only in one way.

A function can access variables of the parent scope. In other words, a function defined in the global scope can access all variables defined in the global scope.

```javascript
// Global Scope
var a = "Hello";

// This function is defined in the global scope
function sayHello(name) {
	return a + " " + name;
}

sayHello("WDI");
=> "Hello WDI";
```

#### Nested function scope

When a function is defined inside another function, it is possible to access variables defined in the parent from the child:

```javascript
  var a = 1;

  function getScore () {
    var b = 2,
    c = 3;

    function add() {
    return a + b + c;
    }

    return add();
  }

  getScore();
  => 6
```

**REFERENCE**: https://gist.github.com/mdang/7f89497e75430542310e

## Context

+ All objects (including functions) have a notion of context
+ Context has to do with where code is *executed* (not where it is *defined*)
+ Context refers to the value of the word `this`
+ The `this` keyword always refers to the currently executing object

#### `this` in the Global context

In the global scope, `this` refers to the global object:

```javascript
this === window
=> true

this.document === document
=> true

this.aValue = "WDI";
=> "WDI"
console.log(window.aValue);
=> "WDI"
```

#### As an object method

If a function is part of an object (we then call it a method), `this` refers to the object that has been defined and called:

```javascript
var wdi = {
  name: "WDI",
  whatsTheName: function() {
    return this.name;
  }

wdi.whatsTheName();
=> "WDI"
```

**EXERCISE**: https://gist.github.com/mdang/c8d161542c52334eee91
