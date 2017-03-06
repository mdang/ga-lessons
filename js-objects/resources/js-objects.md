## JavaScript Objects

### Learning Objectives

* Describe what an object is and how it differs from an array
* Initialize an empty object using the object literal syntax
* Describe what a key-value store is an why it is valuable as a data structure
* Define what object properties and methods are
* Contrast the JS object dot notation with bracket notation
* Add properties to an existing object using the dot notation
* Add properties to an existing object using the bracket notation
* Retrieve value from a property of an object using the dot notation
* Retrieve value from a property of an object using the bracket notation
* Use a for..in loop to iterate through the properties of an object
* Explain the .hasOwnProperty method and why it is useful in iterating through object properties
* Create a JS object method inside an object literal
* Explain Javascript 'context' and what the value of the 'this' keyword refers to
* Explain what JSON is, what purpose it serves, and how it differs from Javascript object literals

### Review

- Primary data types 
  * String
  * Number
  * Boolean
- Special data types
  * Undefined
  * Null
- Composite data types
  * Arrays
  * Objects
- What are functions? Why are they useful? 
- How do we concatenate strings? 
- Why is console.log() useful? 
- What's the difference between true, false, truthy, falsy? 
- How do we loop through arrays? 

## What is an object? 

A JavaScript object is a collection of name/value pairs. These name/value pairs are referred to as properties. Properties with a function definition are called methods. 

In contrast, an array is a variable that can store multiple variables within it. Example is an array of car types.

Although arrays can store multiple values in one variable, they are individual values and not a collection of name/value pairs like objects are. You are able to store functions within properties in objects and reference them by a key, or any other property for that matter. With arrays you can only reference values by an index number. 

> Draw on the whiteboard what a key/value data container looks like, and contrast with array data container.

## Creating objects

There are 4 different ways to create an object.

#### Object literals

An object literal is a list of zero or more pairs of property names and associated values of an object, enclosed in curly braces. It has the same result as using the new contructor, but it takes up less space and is more readable. JSLint will give you warnings if not using the object literal syntax. 

```js 
var person = {
  foo: 'bar'
};
```

#### Object constructor

```js 
var person = new Object();
person.foo = 'bar';
```

#### Constructor function

It is also possible to use a `function` statement to create an object that serves as a "constructor function."

The first step is to write a function that will define the object. By convention, this function we start the function name with a capital letter. Once the function is defined (in the current scope), you can create a new object by using the keyword `new`.

```javascript
function Classroom(name, numberOfStudents) {
  this.name = name;
  this.numberOfStudents = numberOfStudents;
}

var wdi = new Classroom("WDI Austin", 22);
```

#### Object.create

It's possible to use the method [`Object.create()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/create).

This method can take an object as an argument, allowing you to create an object without having to use a constructor function.

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

##### What is a key-value store and why is it valuable?

Key-value stores allow us to group related properties and methods into a single object. They give us a method of accessing individual properties and methods by a key. 

* **Keys** can only appear once within the object. 
* **Values** can be strings, numbers, booleans, nulls, functions, arrays, and even other objects. 

```js

var wdiStudents = {
  'count': 22,
  'lovesHomework': true,
  'location': 'WeWork',
  'languages': ['JavaScript', 'Ruby'],
  'showStudents': function() {
    console.log('Bob');
    console.log('Lauren');
  },
  'groups': {
    'one': ['Justin', 'Steve'],
    'two': ['Jordan', 'Cody']
  },
};

// Dot notation
var studentCount = students.count;

// Bracket notation 
var studentCount = students[count];

```

### Designing your own object

**Turn and Talk - 10 min**

Come up with your own JavaScript object or use one of the following: 

* photo
* photo album
* monkey
* cat
* dog

What kind of properties and methods would make sense for that object? Write them down. Don't worry about putting it into code, think about the design for now. 

##### Initialize an empty object with the object literal syntax
```js
var dog = {};
```

##### Add properties to an object using dot notation 

If you want to use dot . operator to access the key then the key must be a valid identifier which means they can not begin with a number or contain space.

```js
dog.numberOfLegs = 4;
```

##### Add properties to an object using bracket notation
```js
dog['name'] = 'Scruffy'; 
```

##### Create a JS method within an object literal 
```js

// Within the object literal
dog = {
  bark: function() {
    console.log('bark bark bark!');
  }
};

// Using dot notation 
dog.bark = function() {
  console.log('bark bark bark!');
};
```

##### Retrieve value from a property of an object using the dot notation
```js
var name = dog.name;
```

##### Retrieve value from a property of an object using the bracket notation
```js
var numberOfLegs = dog['numberOfLegs'];
```

### hasOwnProperty()

The "hasOwnProperty" method is useful for checking a property's existence on the object itself. It won't check the object's prototype for any inherited properties. 

```js

var obj = {
  foo: true,
};

obj.hasOwnProperty('foo'); // true
obj.hasOwnProperty('bar'); // false

```

### Use a for..in loop to iterate through the properties of an object

A for..in loop iterates over enumerable properties within an object. Certain properties are inherited from an object's prototype like the toString() method which are not considered enumerable. 

```js

var obj = {
  a:1, 
  b:2, 
  c:3
};
    
for (var prop in obj) {
  console.log(prop + " = " + obj[prop]);
}

```

## `this` for object references

In JavaScript, `this` is a keyword that refers to the current object. When you use the 'this' keyword inside an object method, this is bound to the "immediate" enclosing object.

```js
var classroom = {
  name: "WDI",
  campus: "Austin",
  start: "1/1/2000",
  classInfo: function(){
    console.log("This is " + this.name + " and the class starts on " + this.start);
  }
};

classroom.classInfo()
=> This is WDI and it starts on 1/1/2000
```

### Class Exercise

**25 min**

https://gist.github.com/mdang/e4dc67d311a8620dc5df

### JSON

JSON (JavaScript Object Notation) is a language agnostic data interchange format. It's replaced XML as the standard for exchanging data in a format recognizable to most programming languages out there. 

The syntax of JSON was inspired by the JavaScript Object Literal Notation, but there are some key differences: 

* In JSON, every key must be enclosed in quotes (prevent usage of reserved words as a key)
* You must use double quotes, single quotes will cause an error
* Functions are not allowed as values unless they are serialized as a string

```js
// JSON:
{ "foo": "bar" }

// Object literal:
var obj = { foo: "bar" };

// Invalid JSON:
{ "foo": 'bar' }
```
