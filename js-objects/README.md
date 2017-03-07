# JavaScript Objects

### Learning Objectives

* Describe what an object is and how it differs from an array
* Initialize an empty object using the object literal syntax
* Describe what a key-value store is an why it is valuable as a data structure
* Define what object properties and methods are
* Contrast the JS object dot notation with bracket notation
* Add properties to an existing object 
* Retrieve value from a property of an object 
* Use a `for..in` loop to iterate through the properties of an object
* Explain the `.hasOwnProperty` method and why it is useful in iterating through object properties
* Create a JS object method inside an object literal
* Explain Javascript 'context' and what the value of the `this` keyword refers to

## What

An object is a **collection of key-value pairs** that all have some sort of relationship and are connected logically to one another. These name/value pairs are referred to as properties. Properties with a function definition are called methods. Below is an example of an object.

```js
// Literal Object Definition
var car = {
  wheels: 4,
  topSpeed: 110,
  currentSpeed: 0,
  color: 'blue',
  inWorkingOrder: true,
  damage: ['chipped windshield','dented back left bumper', 'passenger window squeaks']
}
```

Key-value stores allow us to group related properties and methods into a single object. They give us a method of accessing individual properties and methods by a key.

- Keys can only appear once within the object.
- Values can be strings, numbers, booleans, nulls, functions, arrays, and even other objects.

## Why

From Eloquent JavaScript:

> Numbers, Booleans, and strings are the bricks that data structures are built from. But you can’t make much of a house out of a single brick. Objects allow us to group values—including other objects—together and thus build more complex structures.

If we want to write code of any complexity, we are going to need to understand objects, how to create them, how to manipulate them, how to access data within them, and how to think about them.

## Creating Objects

### Object Literals

```js
var person = {
  foo: 'bar'
};
```

### Constructor Functions

```js
function Classroom(name, numberOfStudents) {
  this.name = name;
  this.numberOfStudents = numberOfStudents;
}

var wdi = new Classroom("WDI Austin", 22);
```

### Object.create

```js
var Person = {
  type: "Instructor",
  displayType: function(){
    console.log(this.type);
  }
}

var person1 = Object.create(Person);
person1.displayType();
=> Instructor

var person2 = Object.create(Person);
person2.type = "Student";
person2.displayType();
=> Student
```
