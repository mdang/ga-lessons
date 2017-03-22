# JavaScript OOP

### Learning Objectives

- Reiterate the basic principles of OOP, and how they can help to clean up code
- Describe what prototypal inheritance is, and how it differs from classical inheritance
- Describe what prototype chains are, and what is at the top of every chain
- Explain what a constructor function is
- Compare and contrast creating objects using literal notation vs. constructor notation.
- Define methods on custom objects by attaching them to the prototype
- Understand object inheritance
- Namespace an application and objects properly

<a name="opening"></a>
## Opening (10 mins)
- Review current lesson objectives

Before we get started, watch this short [case study](https://generalassembly.wistia.com/medias/0bgiqqwd68) where a developer describes the role Object Oriented Programming (OOP) plays in his personal workflow and in programming in general.

Understanding OOP concepts gives us an excellent frame of reference for a lot of information that comes later in the course. OOP concepts are the most common way that developers think about organizing code at a high level.

Object oriented programming is a common pattern throughout many languages. Its patterns will enable you to write more readable, organized, and declarative programs. Simply put, understanding Object Oriented Programming will make us better developers.


**Check:** Think about a game of soccer.  Let's think about all the pieces that make up that game, what are they?  What are some of their properties, things that describe them?  How about their methods, what do they do?

> Instructor Note: Pause for 1 minute, then cold-call and write this on white board as students fill in details. 

***

### Review: What is an Object?
So far in this course, we have been writing our Javascript code using mainly functions, strings, numbers, and arrays.

In our intro lesson on objects, we introduced objects as a way to store and work with more complex data. 

Before we begin, let's review what objects look like by taking a look at the following object:

```js
var superman = {
  // Properties
  firstName: "Clark",
  lastName: "Kent",
  superheroName: "Superman",

  // Method
  revealIdentity: function () {
    return this.firstName + " " + this.lastName + " is " + this.superheroName;
  }
};
```

*We can assume that an Object is a collection of properties (key & value pairs) that all have some sort of relationship, connected logically to one another.*  

> Instructor Note: CFU: Fist-to-five on Object properties, methods

***

<a name="constructor-notation"></a>
## Guided Practice: Constructor Notation (15 mins)
There might be instances where we want to create multiple objects to represent similar things.

For example, if we built a superhero fan site, we'd want to store similar information for a range of superheroes: first name, last name, superhero name, etc.

To do this, we can create a "template" object that contains any properties and methods we want to add for each superhero.

<img src="http://circuits-assets.generalassemb.ly/prod/asset/4536/Slide-3-Superhero-Fan-Site.svg" width="300px">


#### Model a Hero

Now let's imagine that we want to create a new superhero object for Batman.

Let's assume that it looks something like this:

```js
var batman = {
  // Properties
  firstName: "Bruce",
  lastName: "Wayne",
  superheroName: "Batman",

  // Method
  revealIdentity: function () {
    return this.firstName + " " + this.lastName + " is " + this.superheroName;
  }
};
```

#### Check - Think/Pair/Share:

> What features do superman and batman share? Remember to think about attributes and methods when you're modeling. Also take note of what differs between them. What other properties might they share?

Make a diagram of our hero entity based on the above objects.


#### Enter Constructor Notation

We can create object templates with a function called a constructor.

Constructor notation can be used to:

1.  Create a single, empty object.
2.  Create multiple instances of similar objects.

#### Creating an Object using Constructor Notation

First, let's take a look at how we can create a single, empty object using constructor notation.


Take a look:

```js
var superman = new Object();
```

Here, we save our object to the variable `superman`.

Then, we create the new object by using the `new` keyword followed by the object constructor.

The result is an empty superman object. It doesn't have any associated properties or methods yet, so we need to add them.

#### Adding Properties
We can add properties to our object using either the dot notation (`.`) or square bracket syntax (`[ ]`).

```js
superman.firstName = 'Clark';
superman.lastName = 'Kent';
superman.superheroName = 'Superman';
```

We can add methods to our objects using the dot notation:

```js
superman.revealIdentity = function () {
return this.firstName + " " + this.lastName + " is " + this.superheroName;
};
```

#### Accessing/Updating Properties
We can also access and update properties using either the dot notation or square bracket syntax, just like we did with our object literals:

```js
// Accessing Values
var heroFirst = superman.firstName;

// Updating Values
superman.firstName = 'Bill';
superman['superheroName'] = 'Super Duper Man';
```

#### Exercise:

1.  Create an object `currentlyListening`
2.  Add the following properties to your object:

*   The `album` is "Wild Honey"
*   The `artist` is "The Beach Boys"
*   The `releaseDate` is 1967
*   The `label` is "Capitol Records"


Answer option 1:

```js
var currentlyListening = new Object();
currentlyListening.album = "Wild Honey";
currentlyListening.artist = "The Beach Boys";
currentlyListening.releaseDate = 1967;
currentlyListening.label = "Capitol Records";
```

Answer option 2:

```js
var currentlyListening = new Object();
currentlyListening["album"] = "Wild Honey";
currentlyListening["artist"] = "The Beach Boys";
currentlyListening["releaseDate"] = 1967;
currentlyListening["label"] = "Capitol Records";
```

<img src="http://circuits-assets.generalassemb.ly/prod/asset/4538/Slide-10-Beach-Boys-Album.jpg" width="300px">

***

<a name="multiple-objects"></a>
## Creating Multiple Objects using Constructor Notation (25 mins)

Whew! With that under our belt, it's now time to turn to creating many objects using **constructor notation**.

The real power of constructor notation comes into play when we create multiple objects to represent similar things.

Think about our superhero fan site.

As you'll recall, we want a way to store similar info for many superheroes: first name, last name, superhero name, etc.

We need to create a "template" object, which contains the properties we want to add for each superhero.

However, it's a little bit more than just a template because of how Prototypical inheritance works, as instances of an Object have links to the object that created them. We'll discuss this later in this lesson.

#### Constructor Function
To create this object template, we use a function called a **constructor**.

This is really just a function like any other, but, when you call it in a particular way, JavaScript works its magic.

Let's see an example of an object constructor function.

Here, we are creating a `Superhero` function. It's just like creating any other function in JavaScript.

```js
var Superhero = function () {};
```

Note that it is convention to _capitalize the name of the function_ when creating a constructor function. We'll take a look at this again in a moment.


#### Creating Object Instances
Creating an instance of our `Superhero` object is similar to creating a new empty object using constructor notation:

```js
var clark = new Superhero();
var bruce = new Superhero();
```


Here, we save our new objects to the variables `clark` and `bruce`. We use the `new` keyword, similar to when we created a new empty object above. We then use the name of the constructor function `Superhero`, followed by parenthesis `()`.

Note that the name of a constructor function usually begins with a capital letter — unlike other functions — to remind developers to use the `new` keyword when creating an object using that function.


The constructor function is called at the moment that our `new` object is **instantiated**.

For example:

```js
var Superhero = function () {
  console.log('Superhero instance created');
};

var clark = new Superhero(); 
=> "Superhero instance created"

var bruce = new Superhero(); 
=> "Superhero instance created"
```

Messages are logged to the console as soon as we create a new instance of our object.

#### Setting Up Properties/Methods
Up until this point, we've set property names manually, for every new object we create.

The point of our objects/constructors is to create blueprints of our data models, so that, when we create a new instance, we can change particular properties instead of resetting all of the object's keys.


Properties can be set in the constructor so they are set specifically for each instance. In other words, we pass them as arguments in our constructor function.

Take a look at the following example:

```js
var Superhero = function (firstName, lastName, superheroName) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.superheroName = superheroName;
  this.revealIdentity = function () {
    return this.firstName + " " + this.lastName + " is " + this.SuperheroName;
  }
};
```

Let's break this down, line-by-line.


1. Overview: We are using a constructor function to create a template for our `Superhero` objects.
2. We pass three parameters, i.e., the property names each superhero will have in common: `firstName`, `lastName`, and `superheroName`.
3. The object properties `firstName`, `lastName` and `superheroName` are then set through the `this` keyword with the value.
4. Within the function, `firstName` refers to the parameter name we passed to the function. Same with `lastName` and `superheroName`.
5. We then add a method for our object, similar to how we've done it in the past. To add a method, we use the method name `revealIdentity`, followed by an equal sign, followed by an anonymous function (a function without a name).
6. Within the function, we use `this` to access the properties of the instance of the individual object we are creating.

> Note: We defined a method inside the the Superhero constructor here. JavaScript allows it, but don't do it. We'll see the right way to achieve a near identical and preferred result shortly.


#### Creating an Instance
Creating an instance of our `Superhero` object will look like this:


```js
var superman = new Superhero('Clark', 'Kent', 'Superman');
```

```js
var batman = new Superhero('Bruce', 'Wayne', 'Batman');
```

1. Use the `new` keyword followed by the name of our constructor function, `Superhero`.

2. Pass in three arguments, which are the property values that correspond to the three parameters we passed into our `Superhero` constructor function: `firstName`, `lastName`, and `superheroName`.


We've now created two new instances of our Superhero object!

<img src="http://circuits-assets.generalassemb.ly/prod/asset/4550/Slide-19-Charts.svg" width="500px">

We can create as many superheroes as we want using our `Superhero` constructor function.

We also have a blueprint, or template, of our object. So, in the future, when we create a new instance, we won't need to reset all the keys.

All we'll have to do is give values for different properties.

#### Accessing Properties and Methods

We can now access properties of our object instances using dot or square bracket notation:

```js
console.log(superman.firstName + ' ' + superman.lastName);
=> 'Clark Kent'
```

Notice our `revealIdentity` method is also copied over to each individual object.

```js
superman.revealIdentity();
=> 'Clark Kent is Superman'

batman.revealIdentity(); 
=> 'Bruce Wayne is Batman'
```


Creating objects is now much more scalable than if we used literal notation to create every individual object.

Our code will also be cleaner, as we avoid repetition when creating similar objects.

#### this

In the last lesson, we covered how to use the `this` keyword to access properties and methods for our objects.

We also mentioned that `this` is used in place of the object name to refer to the current object instance.

However, when we create several objects using constructor notation, `this` refers to the individual instance of that object.

Let's look at an example:

```js
function Pet (name, species, breed, noise)  {
  this.name = name;
  this.species = species;
  this.breed = breed;
  this.noise =  noise;
  this.makeNoise = function () {
    console.log(this.noise);
  }
}

var wolfman = new Pet('Wolfman', 'cat', 'Tuxedo Cat', 'meow');
var rover = new Pet('Rover', 'dog', 'Golden Retriever', 'bark');
```

<img src="http://circuits-assets.generalassemb.ly/prod/asset/4552/Slide-12-Cat-Tux-Meow.svg" width="300px">


Here, `this` refers to the individual instance of the object we are creating.

So, when we create our `wolfman` object, `this` will refer to the `wolfman` object and `this.noise` will return `'meow'`.

When we create our `rover` object, `this` will refer to our rover object, and `this.noise` will return `'bark'`.


#### Check: 

Test yourself! See if you can guess what `this` refers to in the following situations:

```js
function Pet (name, species, breed, noise)  {
  this.name = name;
  this.species = species;
  this.breed = breed;
  this.noise =  noise;
  this.makeNoise = function () {
    console.log(this.noise);
  }
};

var batman = new Pet('Batman', 'bird', 'parrot', 'chirp');
```

When we create our `batman` object, what will `this` refer to? What will be logged to the console from within the `makeNoise` method?:

`console.log(this.noise);`

> Answer:  
`this` will refer to `batman`.  
`this.noise` will return `'chirp'`.


***

<a name="methods"></a>
## Object Methods (5 mins)
One of the most powerful features of Javascript Objects are Methods, which we covered briefly last lesson. 

Methods are *"functions"* that are predefined and built into an object.  

We all know and love array methods like `forEach()`, `map()`, `filter()`, and `reduce()`; these are all Methods of the `Array` object.  

Let's use Constructor Notation to create a flower object that uses a `bloom` method to output to the console whenever we call it.

```javascript
function Flower (color, petals, smells) {
    this.color = color;
    this.petals = petals;
    this.smells = smells;
    // Demonstrates a simple method in an object
    this.bloom = function() {
        console.log("Look at me!");
    };
};
```

We now have a method inside our flower object called `bloom`.

But there's an issue with the above code. If we create multiple flowers we don't care if the attributes `color`, `petal`, and `smells` all have different values. It makes sense for these values to be different and customizable for each flower. 

However, all flowers could _share_ the `bloom` method. What we want to avoid is creating an entirely new `bloom` method every time we make a new flower.

```javascript
var lily = new Flower("yellow", 6, true);
var rose = new Flower("red", 32, true);

lily.bloom === rose.bloom;
=> false
```

But we want their bloom methods to be the same!


***

<a name="prototypes"></a>
## Prototypes (15 mins)

> Instructor Note: Demo Object.getPrototypeOf(lily), same with "rose", then wrap that in Object.getPrototypeOf(). Fist-to-five on this

All objects have internal links to other objects &mdash; we call these "other objects" prototypes; and that prototype object will have an inherited prototype of its own.  This goes on until we find an object with a `null` prototype. By definition `null` does not have a prototype; it acts as the end of the prototype chain.

![spyqq7jwqubh4oyfvqnnw7g](https://cloud.githubusercontent.com/assets/40461/8396752/737ff1c0-1dab-11e5-83b0-4f380980b2b5.png)

We know that objects are basically key/value pairs. When you ask for a key's value from an object, JavaScript will look, first, to find the value in the instance of the object, and then, if it doesn't exist, it will look to that object's prototype 'default value'.

 Note that this inheritance chain can go as long as you want, but generally, it's better to keep them short and have your code easier to understand.

#### Prototypes as pointers

The easiest way to see prototypes in Javascript are as pointers other objects saved on the current object. Take a look at the diagram below:

> Instructor Note: Explain this diagram with the class.

![prototype-diagram](https://cloud.githubusercontent.com/assets/40461/8397563/f78b92c8-1dc7-11e5-97fc-79a56d682626.png)

#### Adding Methods to our Flower Object

Using Prototype will enable us to easily define methods to all instances created by a constructor function while saving memory. What's great is that the method will only be applied to the prototype of the object, so it is only stored in the memory once, because objects coming from the same constructor point to one common prototype object.

By adding the method `bloom` to the constructor's **prototype** we can enable all flowers to share a `bloom` method, or any other method for that matter!

```javascript
function Flower (color, petals, smells) {
    this.color = color;
    this.petals = petals;
    this.smells = smells;
};

Flower.prototype = {
  bloom: function() {
    console.log("Look at me!");
  }
};
```

Now try running the same test to see if both flowers share the same `bloom` method.

```javascript
var lily = new Flower("yellow", 6, true);
var rose = new Flower("red", 32, true);

lily.bloom === rose.bloom;
=> true
```

#### Benefits of this approach
- Less wasted memory
- Single source of truth

>What if we edit the prototype *after* the flower instances have been created? Will they update their behavior accordingly?

<!-- Pass out flowers or have each student choose one of the flower images in the images folder -->

#### More methods
Let's add some more methods to the flower constructor.

```javascript
function Flower(color, petals, smells) {
    this.color = color;
    this.petals = petals;
    this.smells = smells;
};

Flower.prototype = {
  bloom: function() {
    console.log("Look at me!");
  },
  smellsGood: function() {
  // use 'this' to access the instance's attributes
    if (this.smells) {
      return 'This flower smells amazing!';
    } else {
      return 'What a noxious weed!';
    }
  },
  describe: function() {
    console.log("This flower is " + this.color + ".");    
  }
};
```

Methods can also access properties within the object with the `this` identifier rather than using dot or bracket notation.

#### Quick Challenge - Wilt & water

- Create a `wilt()` method that decrements each flower by one petal. :(
- Create a `water()` method that increments each flower by one petal. :)

***

## Exercise: Soldiers

- 15 min

[Create soldier objects](./exercises/army/readme.md)

***

## We Do: Adding Armies to Soldiers

- Take the code for soldiers
- Switch to files 
  * js/army.js
  * js/soldier.js
  * js/main.js
- Now we will add armies in addition to soldiers

[Solution](./exercises/army_extended/)

***

<a name="modeling-flowers"></a>
## Independent Practice: Modeling Flowers (15 mins)

Pick one of the flowers in the [starter code folder](starter_code/flowers).

Decide amongst your
tablemates the type of flower, the flower's main color, number of petals, and whether or not it smells pretty. Think up some other possible properties or methods. Try to think of at least three.

1. Take 5 minutes to create a Flower object that includes the properties/methods you discussed as a group based on the flower on your table, using a Constructor function. Then create a flower instance for your individual flower.
2. Take another couple minutes to create a flower instance based on your neighbor's flower.

> Check: Now we should have a flower instance for each of our actual flowers.
> 
> Let's source the best new properties that were created on their constructors and integrate them into a universal flower constructor.

***

<a name="cross-pollination"></a>
## Guided Practice: Cross-Pollination (10 mins) (If Time Permits
Now that we are awesome Flower experts, let's try our hand at cross pollinating two flower objects. Cross pollinating is beyond the realm of an individual flower and could therefore live on the Flower constructor itself. Other examples of this would be `create`, `new`, or `destroy`. These are all *meta* actions of a flower; a flower cannot create itself! They are called **static methods**.

Check: Think-pair-share - How might we declare this method?

To exemplify this let's create a static method (also sometimes refered to as a class method) called `crossPollinate` as opposed to the instance methods we've been making (e.g. `bloom`)

- The method will take two flower instances as arguments.    
- Return a new flower instance that is a mix of both "parent" colors. (i.e. red, yellow = "red-yellow"; we don't care about the color wheel).
- Make the new petal count an average between the two parents' petal counts.
- The smellPretty gene is recessive, unfortunately. This means that a flower will smell pretty IF and only IF both flowers smell pretty.  

<details>
<summary>Example solution</summary>

```javascript
// constructor
function Flower(color, petals, smells) {
    this.color = color;
    this.petals = petals;
    this.smells = smells;
}

// static methods
Flower.crossPollinate = function(momFlower, dadFlower) {
  var color = momFlower.color + "-" + dadFlower.color;
  var petals = (momFlower.petals + dadFlower.petals) / 2;
  var smells = momFlower.smells && dadFlower.smells;
  var babyFlower = new Flower(color, petals, smells);
  return babyFlower;
}

// instance methods
Flower.prototype = {
  bloom: function() {
    console.log("Look at me!");
  },
  smellsGood: function() {
    if (this.smells) {
      return 'This flower smells amazing!';
    } else {
      return 'What a noxious weed!';
    }
  },
  describe: function() {
    // Demonstrates use of local object variables
    // use `this` to access the instance's attributes
    console.log("This flower is " + this.color + ".");    
  }
}


var lily = new Flower("blue", 32, true);
var rose = new Flower("green", 12, true);

var rily = Flower.crossPollinate(rose, lily);

rily.smellsGood();
```

</details>

**Thought experiment:** *Maybe we create a different intermediary object, called Bee, which would facilitate cross-pollination and return a new flower? Flowers don't just bash their heads together and make new flowers in the real world, they need bees!  What are some methods we could assign to a Bee object?*

***

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

***

<a name="conclusion"></a>
## Conclusion (5 mins)
Almost everything in Javascript either is an object or inherits from an object.  As you walk around the outside world, start thinking "how could I write that as a JavaScript object?". 

What properties do people on the train have?  What about the train itself?

That's how most Javascript developers think, to one degree or another. I want to create a game, or an app, how would I model all my objects?

* Why is using a prototype useful?
* Would you typically put the methods or attributes in the prototype?
* When would we use static methods?

***
