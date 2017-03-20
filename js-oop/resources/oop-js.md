# OOP JavaScript

### Learning Objectives

- Reiterate the basic principles of OOP, and how they can help to clean up code
- Describe what prototypal inheritance is, and how it differs from classical inheritance
- Describe what prototype chains are, and what is at the top of every chain
- Explain what a constructor function is
- Explain what the `new` keyword does
- Organize JS code modularly into multiple files that rely on one another
- Namespace an application and objects properly

## Preparation

- Functions
  - First class functions - Ability to assign functions into variables, pass it around
  - Higher order functions - Ability to pass functions as an argument to other functions, return functions
    - Callbacks
  - Named functions
  - Anonymous functions
  - Function definition
- Variable scope
  - Local - Declared inside a function definition
  - Global - Declared outside a function, accessible and modifiable throughout the app
  - Hoisting
- Objects
  - Object literal 
  - Properties
  - Methods
  - Constructor functions
    - `new`
    - `this`, self

## Intro

> Question: Think back to the Ruby unit. Why do we care about writing object oriented code? 

* **Abstraction** - Only including what is truly important for an object in its design
* **Encapsulation** - Hiding of data implementation, restricting access to getters and setters
* **Inheritance** - The ability for one object to take on the behaviors and functionality of another object
* **Polymorphism** - Providing a common and consistent interface among different objects

## Prototypal Inheritance

#### Ruby vs JS inheritance

Technically speaking, there are no classes in JavaScript - that's because even though JavaScript is object-oriented, it is not a class-based language like Ruby. Rather, it's [prototype-based](https://en.wikipedia.org/wiki/Prototype-based_programming). But we can use JavaScript just like we're used to - as a class-based language - if we think of constructor functions like classes, like so many people do.


#### Prototype Chain

All objects have internal links to other objects - we call these "other objects" prototypes; and that prototype object will have an inherited prototype of its own.  This goes on until we find an object with a `null` prototype. By definition `null` does not have a prototype; it acts as the end of the prototype chain.

![spyqq7jwqubh4oyfvqnnw7g](https://cloud.githubusercontent.com/assets/40461/8396752/737ff1c0-1dab-11e5-83b0-4f380980b2b5.png)

We know that objects are basically key/value pairs. When you ask for a key's value from an object, JavaScript will look, first, to find the value in the instance of the object, and then, if it doesn't exist, it will look to that object's prototype 'default value', just like single-parent inheritance in Ruby. Note that this inheritance chains can go as long as you want, but generally, it's better to keep them short and have your code easier to understand.

#### Implementation

##### Method #1 - `new`

```js
// Using the `new` keyword
function Animal() {
    this.wild = true;
}
function Lion() {
    this.legs = 4;
}

// This will work in older browsers, you have to construct a new object everytime which might not be efficient
Lion.prototype = new Animal();

var simba = new Lion();

console.log('is this animal wild?', simba.wild);
console.log('number of legs: ', simba.legs);
```

##### Method #2 - `Object.create`

```js
// Using `Object.create`
function Animal() {
    this.wild = true;
}
function Lion() {
    this.legs = 4;
    // Call the parent constructor, making sure (using Function#call) that "this" is set correctly during the call
    Animal.call(this);
}

// This will work in older browsers, you have to construct a new object everytime which might not be efficient
Lion.prototype = Object.create(Animal.prototype);

var simba = new Lion();

console.log('is this animal wild?', simba.wild);
console.log('number of legs: ', simba.legs);
```

## Namespacing

Namespacing protects your code from global variables that might have been set by 3rd party libraries/scripts, even from your own code in some cases.

```js
var GA = GA || {};

function Course(name) {
    this.name = name;
    this.instructors = [];
}

Course.prototype = {
    getInfo: function() {
      return 'The name for this wonderful course is: ' + this.name;
    },
    setInstructors: function(instructors) {
      this.instructors = instructors;
    },
    printInstructors: function() {
      for (var i=0; i<this.instructors.length; i++) {
          console.log(this.instructors[i]);
      }
    }
};

GA.course = new Course('Web Development Immersive');
GA.course.instructors = ['Matt', 'Sean', 'Mike'];
GA.course.getInfo();
GA.course.printInstructors();
```

## Tying it together

#### Travelocity Cannonball
[travelocity.com](https://web.archive.org/web/20120331213204/http://www.travelocity.com/)

* [Cannonball JS 1.0](https://github.com/ga-students/wdi-atx-3-class/blob/master/w07/d02/morning/examples/jquery.cannonball-1.0.js)
* [Cannonball JS 1.6](https://github.com/ga-students/wdi-atx-3-class/blob/master/w07/d02/morning/examples/jquery.cannonball-1.6.js)
  - At this point the code is becoming difficult to maintain and read
* [Cannonball Cruise JS](https://github.com/ga-students/wdi-atx-3-class/blob/master/w07/d02/morning/examples/jquery.cb.cruise-1.0.js)
  - Splitting each individual cannonball into its own file

#### PackStack Caster
* [GitHub](https://github.com/taphat/packstackco/tree/master/public/js/src/cast)
