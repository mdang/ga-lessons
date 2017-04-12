# ES6

### Learning Objectives

* Understand how ES6 differs from the JavaScript now
* Explain and be able to use:
  - Template literals / String interpolation
  - `let` vs `const` vs `var`
  - Block scope
  - Arrow functions
  - Shorthand properties / Object enhancements
  - Default parameters
  - Classes and inheritance
  - Spread operator
  - Destructured assignment
  - Import and export
  - Promises

## History

ES6, also known as ECMAScript 6, ES6 Harmony, ECMAScript 2015, is the latest version of the ECMAScript standard that was released in June 2015. ES6 is a significant update to the language, and the first update to the language since ES5 was standardized in 2009. Implementation of these features in major JavaScript engines is underway now. It adds a ton of new syntax and functionality aimed at making writing complex applications easier.

## Compatiblity

We can't just wrecklessly start using ES6 features, support is good overall but not every feature is supported in different browsers yet. 

To see where we can use it, [we can view this compatibility chart](https://kangax.github.io/compat-table/es6/).

### Babel

https://babeljs.io/

Babel.js is a wonderful tool for compiling your JavaScript. With a build tool like Webpack you tell it which transformations to make on your code, while Babel is the specific transformation itself. In terms of React, Babel is going to allow us to transform our JSX into actual JavaScript. What’s nice about Babel though is it can be used for much more than just JSX -> JS transformations. You can also opt into “future” versions of JavaScript (ES2015, 2016, etc) and use Babel to transform your future JavaScript to modern day JavaScript so the browser can understand it. Let’s jump into what this looks like.

Other tools make use of Babel because Babel is what actually converts ES6 code to ES5 for compatibility in browsers. 

### Browserify

http://browserify.org/

> Browserify is a tool for writing code that follows the CommonJS pattern and packaging it to be used in the browser. It lets you `require(‘modules’)` in the browser by bundling up all of your dependencies.

### Webpack

https://webpack.github.io/

> Webpack is a bundler for modules. The main purpose is to bundle JavaScript files for usage in a browser, yet it is also capable of transforming, bundling, or packaging just about any resource or asset.

### Browserify/Gulp vs Webpack

https://medium.com/@housecor/browserify-vs-webpack-b3d7ca08a0a9#.iz1sdv1pw

Browserify is simple but is limited, you probably need a build tool like Gulp or Grunt with it. This requires more configuration and time to set up typically. Webpack is powerful enough to take the place of both Browserify and Gulp together. 

### Babel Standalone

https://github.com/Daniel15/babel-standalone

It's possible to transform your ES6 code directly in the browser, but this is **NOT** recommended, as it's a hit on performance and not efficient. You should transform the code using something like webpack instead. 

## ES6 Features

### Template literals / String interpolation

Template strings provide syntactic sugar for constructing strings. This is similar to string interpolation features in Perl, Python and more.

#### Multi-line Strings

```js
// ES5
"<h1>❤ unicorns</h1>\n" +
"<p>Unicorn pegasus pony rainbows pegasus pony kittens. Pop pigeon rainbows pony delight kittens kittens surprise. Wereunicorn delight pony pony social unicorn surprise.</p>\n" +
"<ol>\n" +
"<li>Yea! Yeah!</li>\n" +
"<li>Yeah, woo-hoo!</li>\n" +
"</ol>"
```

In ES2015 you can place strings between back-ticks (the symbol below the `esc` key) to use multi-line strings:

```js
// ES6
`<h1>❤ unicorns</h1>
<p>Unicorn pegasus pony rainbows pegasus pony kittens. Pop pigeon rainbows pony delight kittens kittens surprise. Wereunicorn delight pony pony social unicorn surprise.</p>
<ol>
<li>Yea! Yeah!</li>
<li>Yeah, woo-hoo!</li>
</ol>`
```

#### Template Literals or String Interpolation

```js
// ES5
var name = "Sam", age = 71;
"Hello my name is "+ name +" and I'm "+ age +" years old!"
```

ES2015 introduces template literals which make the process much less painful. Back-ticks are also required and this also supports multi-line strings.

```js
// ES2015
var name = "bob", age = 71;
`Hellow my name is ${name} and I'm ${age} years old!`
```

#### New String Methods

With ES6, the standard library has grown immensely. Along with these changes are new methods which can be used on strings, such as `.includes()` and `.repeat()`.

```js
//ES5
var string = 'food';
var substring = 'foo';

console.log(string.indexOf(substring) > -1);

//ES6
const string = 'food';
const substring = 'foo';

console.log(string.includes(substring));

//ES5
function repeat(string, count) {
    var strings = [];
    while(strings.length < count) {
        strings.push(string);
    }
    return strings.join('');
}

//ES6
// String.repeat(numberOfRepetitions)
'meow'.repeat(3); // 'meowmeowmeow'
```
  
### `let` vs `const` vs `var`

#### Let
`let` is the new `var`.

The `var` statement declares a variable globally, or locally to an entire function, optionally initializing it to a value.

```js
// ES5
function varTest() {
  var x = 31;
  if (true) {
    var x = 71;  // same variable!
    console.log(x);  // 71
  }
  console.log(x);  // 71
}
```

The `let` statement declares a **block scope** local variable, optionally initializing it to a value.

```js
// ES2015
function letTest() {
  let x = 31;
  if (true) {
    let x = 71;  // different variable
    console.log(x);  // 71
  }
  console.log(x);  // 31
}
```

Another example:

```js
function varTest() {
  var x = 1;
  if (true) {
    var x = 2;  // same variable!
    console.log(x);  // 2
  }
  console.log(x);  // 2
}

function letTest() {
  let x = 1;
  if (true) {
    let x = 2;  // different variable
    console.log(x);  // 2
  }
  console.log(x);  // 1
}

varTest();
letTest();
```

#### Const

Everything `let` does `const` also does, except that `const` can't be reassigned. The const declaration creates a read-only reference to a value. It does not mean the value it holds is immutable. Const requires an initial value. It is read-only.

```js
const MY_FAV = 7;

// this will throw an error in Firefox and Chrome (but does not fail in Safari)
MY_FAV = 20;

// will print 7
console.log("my favorite number is: " + MY_FAV);
```

### Arrow functions

Arrows are a function shorthand using the `=>` syntax. The two biggest motivations for arrows were **shorter functions** and **lexical `this`**. Arrows can make your code cleaner and more intuitive. They are syntactically similar to the related feature in C#, Java 8 and CoffeeScript. They support both statement block bodies as well as expression bodies which return the value of the expression. 

#### Fat Arrows for Functions

```js
//ES5
var add = function(x, y){
	return x+y;
}

//ES6
var add = (x , y) => x + y;
```

Arrows save having to write `function` & `return` for simple functions like this. When only one variable is used, the parenthesis can even also be omitted `x => x * x`.

Arrows can also be used with block statements. It should be noted that in blocks the `return` is not automatic and needs to be explicitly stated. This still saves having to write `function`.

```js
$('#pizza-btn').click(function (event) {
  preheatOven();
  pizzaInOven();
  return 'I love za!';
});

// ES6
$('#pizza-btn').click( (event) => {
  preheatOven();
  pizzaInOven();
  return 'I love za!'
});
```

Shorter syntax is awesome, especially for not making mistakes like misspelling `funciton`.

> Best practice is to use arrow functions in place of function expressions when possible.

#### Fat Arrows for `this`

Where arrows really shine is by binding `this`. The `this` in an arrow is set to the this value of the enclosing execution context.

**Context** refers to the object that the currently executing function is attached to - determined in most cases by how a function is called. The value of `this` references whatever the current context is. **Scope** is where a variable can be referenced (where it's defined).

Here we have a function, in this case an Object constructor function. Inside our function is a method that executes a callback function. We want the ovenTemp of the Oven to increase every 1000 ms.

```js
function Oven () {
  this.ovenTemp = 0; // here `this` references instance of Oven constructor

  setInterval(function preheatOven() {
    // preheatOven() redefines context of `this`
    this.ovenTemp++;  // here `this` references the global object, undesired action
  }, 1000);
}
```

What does `this` refer to in both spots?
- The Oven.ovenTemp doesn't change because our callback changed the context of `this`.

How can we fix the problem?
- One way we can remedy the problem by [binding](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/bind) `this`.

```js
function Oven () {
  this.ovenTemp = 0; // here `this` references instance of Oven constructor

  setInterval(function preheatOven() {
    this.ovenTemp++;  
  }, 1000).bind(this);
}
```

Another, more performant, way to fix the problem is to store the top level `this` reference/context in a variable, commonly seen as `self = this` or `that = this`.

```js
function Oven () {
  var self = this; // stores top level `this` reference
  self.ovenTemp = 0;

  setInterval(function preheatOven() {
    self.ovenTemp++; // performs desired action
  }, 1000);
}
```

A better solution is to leverage the lexical scoping of arrow functions.

```js
function Oven () {
  this.ovenTemp = 0;

  setInterval( preheatOven = () => {
    this.ovenTemp++;  // here `this` references instance of Oven constructor, as desired
  }, 1000);
}
```

In this particular example we can use an anonymous callback and refactor to one line. Wow that's pretty!

```js
function Oven () {
  this.ovenTemp = 0;
  setInterval( () => { this.ovenTemp++; }, 1000);
}
```

This trivial example shows a non trivial use case - arrows can simplify callbacks and/or closures and allow for more intuitive use of context. 

> Best practice is to use arrow functions whenever you need to preserve the lecical value of `this`.

### Shorthand properties / Object enhancements

```js
let firstName = 'Mike';
let lastName = 'Dang';

let person = { firstName, lastName };

console.log(person);

let mascot = 'Moose';
let team = { person, mascot };

console.log(team);
```

Shorthand for methods:

```js
let firstName = 'Mike';
let lastName = 'Dang';

let person = { 
	firstName, 
	lastName,
	sayHello() {
		console.log('I am saying hello');
	}
};

person.sayHello();
```

### Default parameters

In JavaScript, parameters of functions default to undefined. However, in some situations it might be useful to set a different default value. This is where default parameters can help. Default function parameters allow formal parameters to be initialized with default values if no value or undefined is passed.

```js
//ES5
function addTwoNumbers(x, y) {
    x = x || 0;
    y = y || 0;
    return x + y;
}

// ES6
function addTwoNumbers(x=0, y=0) {
    return x + y;
}

addTwoNumbers(2, 4); // 6
addTwoNumbers(2); // 2
addTwoNumbers(); // 0

function append(value, array = []) {
  array.push(value);
  return array;
}

append(1); // 1
```

### Classes and inheritance

Prior to ES6, we implemented Classes by creating a constructor function and adding properties by extending the prototype:

```js
// ES5
function Pizza(name, temperature) {
  this.name = name;
  this.temperature = temperature
}

Pizza.prototype.heatUp = function () {
  return this.temperature + 20;
};
```

Classes provided syntactic sugar over JavaScript's existing prototype-based inheritance. A class body can only have methods and not data properties. Putting data in prototypes is generally an anti-pattern, so this enforces a best practice. Data is instead attached to classes using the `constructor` method. Instance methods (defined with concise object syntax) are automatically connected through prototypical inheritance.

```js

// ES2015
class Pizza {
  constructor(name, temperature) {
    this.name = name;
    this.temperature = temperature;
  }

  heatUp() {
    return this.temperature + 20;
  }
  
  static sayCool() {
  	console.log("cool!");
  }
}
```

The `static` keyword defines a static method for a class. Static methods are called without instantiating their class and are also not callable when the class is instantiated. Static methods are often used to create utility functions for an application.
[MDN static](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Classes/static)

```js
// ES2015
Pizza.sayCool();
// > "cool!"
let za = new Pizza("cheese", "hot")

za.sayCool();
// TypeError: za.sayCool is not a function
```

Extending a base class in ES6:

```js
class Rectangle extends Polygon {
  constructor(height, width) {
    super(height, width);
    this.name = 'Rectangle';
  }
  // Here, sayName() is a subclassed method which
  // overrides their superclass method of the same name.
  sayName() {
    console.log('Sup! My name is ', this.name + '.');
    super.sayHistory();
  }
}
```

### Spread operator

```js
let first = [1, 2, 3];
let second = [4, 5, 6];

console.log(...first);

function add(a, b, c) {
	return a + b + c;
}

console.log(add(...second));
```

### Destructured assignment

Destructing is a new syntax that makes it easier to extract data from objects and arrays (even deeply nested) and store them in variables with a more convenient syntax.

```js
//ES5
var arr = [1, 2, 3, 4];
var a = arr[0];
var b = arr[1];
var c = arr[2];
var d = arr[3];

//ES6
let [a, b, c, d] = [1, 2, 3, 4];

console.log(a); // 1
console.log(b); // 2

// ES5
var luke = { occupation: 'jedi', father: 'anakin' };
var occupation = luke.occupation; // 'jedi'
var father = luke.father; // 'anakin'

// ES6
let luke = { occupation: 'jedi', father: 'anakin' };
let {occupation, father} = luke;

console.log(occupation); // 'jedi'
console.log(father); // 'anakin'
```

For destructing objects the assigned name needs to match the keys of the object

```js
// ES2015
let x = {y: "pizza", z: 100}
let {foo, bar} = x // not useful: neither foo or bar are in 'x'

console.log(foo); // undefined
console.log(bar); // undefined
```

```js
// Only interested in the `color` property of this array
var { color } = {
	color: 'blue',
	up: 'sky'
}

console.log(color);
```

```js
// Interested in two properties
var { color, up } = {
	color: 'blue',
	up: 'sky'
}

console.log(color);
console.log(up);
```

```js
// Only interested in the third value of this array
let names = ['Mike', 'Joe', 'John']
let [,,john] = names;

console.log('Name is: ', john);
```

### Import and export

```js
// lib/math.js
export function sum(x, y) {
  return x + y;
}
export var pi = 3.141593;

// app.js
import * as math from "lib/math";
console.log("2π = " + math.sum(math.pi, math.pi));

// otherApp.js
import {sum, pi} from "lib/math";
console.log("2π = " + sum(pi, pi));
```

### Promises

Promises allow us to turn our horizontal code (callback hell):

```javascript
func1(function (value1) {
    func2(value1, function (value2) {
        func3(value2, function (value3) {
            func4(value3, function (value4) {
                func5(value4, function (value5) {
                    // Do something with value 5
                });
            });
        });
    });
});
```

Into vertical code:

```javascript
func1(value1)
    .then(func2)
    .then(func3)
    .then(func4)
    .then(func5, value5 => {
        // Do something with value 5
    });
```

Prior to ES6, we used [bluebird](https://github.com/petkaantonov/bluebird) or
[Q](https://github.com/kriskowal/q). Now we have Promises natively:

```javascript
new Promise((resolve, reject) =>
    reject(new Error('Failed to fulfill Promise')))
        .catch(reason => console.log(reason));
```

Where we have two handlers, **resolve** (a function called when the Promise is
**fulfilled**) and **reject** (a function called when the Promise is **rejected**).

> **Benefits of Promises**: Error Handling using a bunch of nested callbacks
can get chaotic. Using Promises, we have a clear path to bubbling errors up
and handling them appropriately. Moreover, the value of a Promise after it has
been resolved/rejected is immutable - it will never change.

Here is a practical example of using Promises:

```javascript
var request = require('request');

return new Promise((resolve, reject) => {
  request.get(url, (error, response, body) => {
    if (body) {
        resolve(JSON.parse(body));
      } else {
        resolve({});
      }
  });
});
```

We can also **parallelize** Promises to handle an array of asynchronous
operations by using `Promise.all()`:

```javascript
let urls = [
  '/api/commits',
  '/api/issues/opened',
  '/api/issues/assigned',
  '/api/issues/completed',
  '/api/issues/comments',
  '/api/pullrequests'
];

let promises = urls.map((url) => {
  return new Promise((resolve, reject) => {
    $.ajax({ url: url })
      .done((data) => {
        resolve(data);
      });
  });
});

Promise.all(promises)
  .then((results) => {
    // Do something with results of all our promises
 });
```

## Class Exercise

Do as many ES6 katas as you can in the time remaining. 

http://es6katas.org/

## Resources

* http://www.es6fiddle.net
* https://egghead.io/courses/learn-es6-ecmascript-2015
* https://babeljs.io/docs/learn-es2015/
