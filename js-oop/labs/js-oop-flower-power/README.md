<!--
Creator: SF WDI. `class` syntax added by Michelle.
Market: SF
-->

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

#Flower Power: Object Oriented Programming in JavaScript

### Why is this important?
<!-- framing the "why" in big-picture/real world examples -->
*This workshop is important because:*

Object oriented programming is a common pattern throughout many languages. Its patterns will enable you to write more readable, organized, and declarative programs.

### What are the objectives?
<!-- specific/measurable goal for students to achieve -->
*After this workshop, developers will be able to:*

- Build practical and useful objects using Javascript constructors
- Demonstrate a working knowledge of object properties and methods
- Design object types in JavaScript using Object Oriented Programming techniques
- Understand the difference between pseudo-classical and prototypal inheritance in JavaScript

### Where should we be now?
<!-- call out the skills that are prerequisites -->
*Before this workshop, developers should already be able to:*

- Create and manipulate JavaScript objects 
- Write and interpret JavaScript functions

### Review
Work with a partner and write your answers.

1. What is an object? How does it hold data? What are two ways we can access things inside of an object?
2. If an object contains a function, how can we call it?

```javascript
var obj = {
  name: "Michelle",
  employer: "GeneralAssembly",
  sayHello: function() {
    console.log("Hello!");
  }

};
// what code would you write here to call the function?
```

3. What is the `this` keyword used for?
4. Think back to looping through an object to put data in your page. If you had this array of objects, would you be able to easily loop through it and add the URLs to the page? Why or why not?
```javascript
var myArray = [
  {
    url: "www.google.com",
    description: "The searching people"
    // other data
  },
  {
    URL: "www.generalassemb.ly",
    info: "The teaching people"
    // other data
  },
  {
    link: "www.jquery.com",
    details: "The $ people",
    // other data
  },
  {
    pageUrl: "developer.mozilla.org",
    pageDescription: "The Firefox people",
    // other data
  }
];
```
###Constructors
For relatively straightforward and small objects, it is perfectly fine to declare them as a variable and define them.  This is known as a *Literal* object definition.

Here's a flower using the *Literal* method:

```javascript
// Literal Object Definition
var flower = {
	color : "red",
	petals : 32,
	smells : true
};
```

There are a few other patterns we can use to create objects. 

We *could* create another flower using `Object.create`. For example:

```javascript
// a rose is a flower
var rose = Object.create(flower);
// now rose is { color : "red", petals : 32, smells : true }
// but, our rose only has 16 petals
rose.petals = 16;
// now rose is { color : "red", petals : 16, smells : true }
```

The `rose` will share all characteristics of the original `flower`, except it will have 16 petals because we overwrote that property.

Using `Object.create` is limited, though. It means we have to remember what all of the properties are that we want to change, and change them manually for that object. Instead, we prefer to use the **constructor** syntax. Let's explore what a Flower constructor might look like:
 
 ```javascript
 // constructor object definition
 // note: constructors are always capitalized by convention
 function Flower() {
 	this.color = "red";
 	this.petals = 32;
 	this.smells= true;
 }
 ```

The constructor is actually a function that can create unique instances of flower objects every time it is called.  Below, we create a new object using the constructor and store it in a variable `tulip`.

```javascript
// the keyword `new` is necessary
var tulip = new Flower();
```

Let's break down a couple concepts introduced with this new line of code:
- The capitalization of `Flower` lets everyone know that `Flower` is an object constructor.  Calling `Flower()` with `new` will return a `Flower`-type object.
- The `new` keyword tells JavaScript that we are creating a new object instance that will be independent of any other object.
- We call the `Flower` function, which creates an object with the properties from the construtor.  Our object is ready to go!


<img alt="tulip from Clare Black (Identity Photogr@phy) on flickr" src="https://cloud.githubusercontent.com/assets/3254910/17949473/5e17a92a-6a0a-11e6-90fb-2294c3d1b6e9.png" width="50%">


Accessing the properties of our new `tulip` object is the same as accessing our properties from any other object: we can use either dot or bracket notation.

```javascript
var color = tulip.color; // red
var petalCount = tulip.petals; // 32
var smellsNice = tulip.smells; //true
```

If we wanted to create yet ANOTHER flower, all we have to do is call our function just like we did above.  This time, lets make an object called `lily`.

```javascript
var lily = new Flower();
```

We can access the properties of `lily` in the same manner as we did with `tulip`.

```javascript
var color = lily.color; // red
var petalCount = lily.petals; // 32
var smellsNice = lily.smells; //true
```

I don't know about you, but I generally like my lilies yellow. I have also never heard of a lily with 32 petals!  Can we change our `lily` object to better reflect my perfect lily? You bet!

```javascript
// Changing object property values
lily.color = 'yellow';
lily.petals = 6;
```

That's more like it!  To change the value of the lily object properties, we simply access them with dot or bracket notation.  We then follow with a single equals assignment operator and give a new appropriate value.  Couldn't be easier!

<img src="https://seniorhikerphotos.files.wordpress.com/2012/06/lilysarina12052301.jpg" width="50%" alt="yellow lily">

###Object Methods
One of the most powerful features of Javascript Objects are Methods.  Methods are *"functions"* that are predefined and built into an object.  We all know and love `Array` methods like `forEach()`, `map()`, `filter()`, and `reduce()`; these are all methods of the `Array` object.  We use arrays so much that Javascript gives us the shorthand `[]` syntax to create them instead of calling the `Array` constructor with `new` to make instances, like we did above with the flowers.  Thanks, Javascript!

Lets make a simple method in the flower constructor that outputs to the console whenever we call it.

```javascript
function Flower() {
    this.color = "red";
    this.petals = 32;
    this.smells= true;
    // Demonstrates a simple method in an object
    this.bloom = function() {
        console.log("Look at me!");
    };
}
```

We new flower instances will have a method inside called `bloom`.

```js
var sunflower = new Flower();
sunflower.color = "yellow";
sunflower.bloom();
// prints out "Look at me!"
```

<img alt="sunflowers by skyseeker on flickr" src="https://cloud.githubusercontent.com/assets/3254910/17949651/461f09f2-6a0b-11e6-96fb-31c01b5f978a.png" width="50%">


There's an issue with  code above. We're creating multiple flowers, but the attributes `color`, `petal`, and `smells` all start with the same values. It makes sense for these properties to be different and customizable for each flower. 

###Independent Practice: Customization

Wouldn't it be nice if at the moment we instantiate a flower we could also define its properties? Refactor the `Flower` constructor to enable this code:

```javascript
var chrysanthemum = new Flower("pink", 65, false);
```

<details>
<summary>Example solution</summary>

```javascript
function Flower(color, petals, smells) {
    this.color = color;
    this.petals = petals;
    this.smells = smells;
    this.bloom = function() {
        console.log("Look at me!");
    };
}
```
</details>

* How could we refactor the parameters that the `Flower` constructor accepts so it takes in a single object that contains all the attributes of the instance we are initializing? Refactor the constructor to enable this code:

```javascript
var options = {petals: 65, color: "pink", smells: false};
var chrysanthemum = new Flower(options);
```

<details>
<summary>Example solution</summary>

```javascript
function Flower(options) {
    this.color = options.color;
    this.petals = options.petals;
    this.smells = options.smells;
    this.bloom = function() {
        console.log("Look at me!");
    };
}
```
</details>

* How can we make the petal count to default to 10, if not otherwise specified? Enable this code:

```javascript
var options = {color: "pink", smells: false};
var chrysanthemum = new Flower(options);
// inspect instance
chrysanthemum;
// => Flower {color: "pink", petals: 10, smells: false}
```

<details>
<summary>Example solution</summary>

```javascript
function Flower(options) {
    this.color = options.color;
    this.petals = options.petals || 10;
    this.smells = options.smells;
    this.bloom = function() {
        console.log("Look at me!");
    };
}
```
</details>



##Prototypes

Flowers can now be created with unique attributes, which is awesome. On the other hand, you may notice that all flowers could share the `bloom` method. Right now, though, each flower instance has a separate bloom method.

```javascript
var lily = new Flower();
var rose = new Flower();

lily.bloom === rose.bloom // false
```

We want their bloom methods to be the same! Next, we'll see how to avoid creating an entirely new `bloom` method every time we make a new flower. 

<img src="https://media.giphy.com/media/10nccX8vZPEeA0/giphy.gif" alt="blooming flower gif" width="50%">

By adding the method `bloom` to the constructor's **prototype** we can enable all flowers to share a `bloom` method, or any other method for that matter! Shared attributes can also be added to the prototype, but they're less common.  The prototype is simply an object that can be referenced by all the flower instances.

```javascript
function Flower() {
    this.color = "red";
    this.petals = 32;
    this.smells= true;
}

Flower.prototype.bloom = function() {
  console.log("Look at me!");
}
```

Now try running the same test from above to see if both flowers share the same `bloom` method.

```javascript
var lily = new Flower();
var rose = new Flower();

lily.bloom === rose.bloom // true
```

####Benefits

- Less wasted memory
- Single source of truth

>What if we edit the prototype *after* the flower instances have been created? Will they update their behavior accordingly?

####More methods

Let's add some more methods to the flower constructor.

```javascript
function Flower() {
    this.color = "red";
    this.petals = 32;
    this.smells= true;
}

Flower.prototype.bloom = function() {
  console.log("Look at me!");
}
Flower.prototype.smellsGood = function() {
// use `this` to access the instance's attributes
  if (this.smells) {
    return 'This flower smells amazing!';
  } else {
    return 'What a noxious weed!';
  }
}
Flower.prototype.describe = function() {
  console.log("This flower is " + this.color + ".");    
}
```
Methods can also access properties within the object with the `this` identifier rather than using dot or bracket notation.

####Check for Understanding: `wilt` and `water`
- Create a `wilt()` method that decrements a flower's petal count by one. :(
- Create a `water()` method that increments a flower's petal count by one. :)

###Independent Practice: Modeling Flowers

Take 10 minutes to create a flower instance based on the flower on your table. Decide amongst your tablemates the type of flower, the flower's main color, number of petals, and whether or not it smells pretty. Think up some other possible properties or methods and add them too!

...

Now we should have a flower instance for each of our actual flowers.

Let's source the best new properties that were created on constructors and integrate them into a universal flower constructor.

### Independent Practice: Cross-Pollination

Now that we are awesome flower experts, lets try our hand at cross pollinating two flower objects. Cross pollinating is beyond the realm of an individual flower. We could create a `crossPollinate` instance method on the prototype, but we can also attach the method to the Flower constructor itself. This would capture the fact that the `crossPollinate` method isn't a behavior of one specific flower. Methods added to an object type instead of an instance are called **static methods**. Other examples could be `create` or `destroy`. These are all *meta* actions of a flower; a flower cannot create itself! 

To exemplify this, let's create a static method (also sometimes refered to as a class method) called `crossPollinate`. We'll have to set it up a little differently than the instance methods we've been making (i.e. `bloom`), because we want to add this new method directly to the `Flower` constructor object.

- The method will take two flower instances as arguments.    
- `crossPollinate` will create a new flower intance that is a mix of both "parent" colors. (i.e. red, yellow = "red-yellow"; don't worry about the color wheel).
- Make the new petal count an average between the two parents' petal counts.
- The smellPretty gene is recessive, unfortunately. This means that a flower will smell pretty IF and ONLY IF both flowers smell pretty. 

```js
// starter code
Flower.crossPollinate = function(/* what parameters are needed? */){
  var newFlower;
  // set up and make the newFlower!
  return newFlower;
};
```

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
Flower.crossPollinate = function(flower1, flower2) {
  var color = flower1.color + "-" + flower2.color;
  var petals = (flower1.petals + flower2.petals) / 2;
  var smells = flower1.smellsGood && flower2.smellsGood;
  var newFlower = new Flower(color, petals, smells);
  return newFlower;
}

// instance methods
Flower.prototype.bloom = function() {
  console.log("Look at me!");
}
Flower.prototype.smellsGood = function(answer) {
  if (answer) {
    return 'This flower smells amazing!';
  } else {
    return 'What a noxious weed!';
  }
}
Flower.prototype.describe = function() {
  // Demonstrates use of local object variables
  // use `this` to access the instance's attributes
  console.log("This flower is " + this.color + ".");    
}

var lily = new Flower("blue", 32, true);
var rose = new Flower("green", 12, true);

var rily = Flower.crossPollinate(rose, lily);
```

</details>

*Thought experiment: Maybe we could create a different intermediary object, called Bee, which would facilitate cross-pollination and return a new flower? Flowers don't just bash their heads together and make new flowers in the real world, they need bees!  What are some methods we could assign to a Bee object?*

<details>
  <summary>some ideas</summary>
  The `Bee` object type could have: 
  - a method to mix flowers:  `crossPollinate(flower1, flower2)`
  - a method to help the bee describe where to find honey for other bees: `dance(location)` 
</details>


<!--### Uber Challenge-->

<!--Create a method within the Flower object that will render a description of your flower along with all of its vital statistics we have collected as well as an image to a simple website.-->

<!--Name your webpage "The San Francisco Seventh Annual General Assembly Parade of Flowers."-->
<!--If we are consistent botanists, our objects will have the same methods and properties.-->
<!--Share your team's flower object on slack, and we will all be able to include all the flowers in our Parade of Flowers website!-->

###Constructor and Prototype Review

**Constructors**

* variables and functions are declared once for each instance
* when you update the constructor, previously created instances DON'T update
* data is "embedded" in each instance

**Prototypes**

* all instances share the same function and variable declarations
* when you update the prototype, previously created instances DO get the updates
* data is "referenced" from the prototype copy

**Instance variables and functions**

* adds variable or function directly to the instance
* overwrites constructor properties/methods by replacing them
* overwrites prototype properties/methods by being earlier on the lookup chain!

**Static variables and functions**

* add values or behaviors directly to the constructor function
* these attributes are not specific to any one instance but apply to the type 
* examples: Math.PI, Apartments.all



### Independent Practice: Object-In-Object

<img src="https://cloud.githubusercontent.com/assets/3254910/17948758/fe31c9e4-6a06-11e6-8c59-c68d975c02a8.png" alt="flower vase image from homeheavenimages on flickr" width=80%>


1. Create a vase object which contains an array of flower objects and a `capacity` attribute that says how many flowers the vase can hold.

  <details><summary>sample solution</summary>
   ```js
   function Vase (capacity){
   	this.capacity = capacity || 12;
   	this.flowers = [];
   }
   ```
  </details>
  
1. Create a method `placeFlower` that accepts a flower object as a parameter and inserts the flower into the array. What if the vase is too small? Update your method so that it checks whether the vase is already holding its capacity of flowers before it adds the extra flower. 
    <details><summary>sample solution</summary>
   ```js
   Vase.prototype.placeFlower = function(flower){
     if (this.flowers.length < this.capacity){
       this.flowers.push(flower);
     } else {
       console.error("no room for more flowers!");
     }
   }
   ```
  </details>
  
1. Create an `addWater` method for a vase that calls the `water` method of each flower inside.
    <details><summary>sample solution</summary>
   ```js
   Vase.prototype.addWater = function(){
     this.flowers.forEach(function(flower){
       flower.water();
     });
   }
   ```
  </details>

1. Feel free to add more properties or methods for your `Vase` object type.

###Protoypal vs Pseudo-Classical Inheritance

So far, we have talked mostly about what is considered _pseudo-classical inheritance_ when we extend properties of an object or class to a new instance. This is called _pseudo-classical_ for JavaScript because it mimics the structure of inheritance in more traditional class-based languages such as Java or C++. It's also similar to how inheritance will work in Ruby.

Some programmers and engineers consider _prototypal inheritance_ to be more appropriate, clear, and/or efficient in JavaScript. This is a matter of opinion of course, but it's worthwhile to examine the difference.

Let's continue the lovely flower examples.

Here's an example of _pseudo-classical_ inheritance:

```js
function Flower(name, numPetals, color, seasonality) {
	this.name = name;
	this.numPetals = numPetals;
	this.color = color;
	this.seasonality = seasonality;
}

Flower.prototype.bloom = function() {
    return "A " + this.color + " " + this.name " has " + this.numPetals.toString() + " petals."
};

var Daisy = new Flower("daisy", 34, "white and yellow", "perrenial");

var Tulip = new Flower("tulip", 6, "red", "annual");
```

 <details><summary>What do you notice?</summary>
 
 * There is a class that serves as a blueprint.
 * The flower instances called `Daisy` and `Tulip` "build" flowers to the specs of the blueprint.
 
   _Note: This is also called a constructor pattern. Using the `.prototype` method is also a way of implementing pseudo-classical inheritance._
 </details>


...and here's the same idea, but with _prototypal inheritance_:

```js
var Flower = {
	bloom: function {
		return "A " + this.color + " " + this.name " has " + this.numPetals.toString() + " petals."
	}
}

var Daisy = Object.create(Flower, {
	name: {
		value: "daisy"
		}
	},
	numPetals: {
		value: 34
		}
	},
	color: {
		value: "white and yellow"
		}
	},
	seasonality: {
		value: "perrenial"
		}
	}
});

/* alternatively to the above 
Object.create() explicit method,
you may use a factory function: */

function flowerFactory(name, numPetals, color, seasonality) {
	var flower = Object.create(Flower);
	flower.name = name;
	flower.numPetals = numPetals;
	flower.color = color;
	flower.seasonality = seasonality;
	return flower;
}

var Tulip = flowerFactory("tulip", 6, "red", "annual");


```

 <details><summary>What's different here?</summary>
 
 * New flowers are created from the exisiting Flower variable.
 * We build flowers based on existing flowers.
 * We can use a factory method to create instances of flowers.
</details>

So which should you use? The answer is a matter of opinion. Here is one popular [StackOverflow post](http://stackoverflow.com/questions/2800964/benefits-of-prototypal-inheritance-over-classical) on the matter.

###Independent Practice

* _Discuss:_ What are the relative merits and drawbacks of each type of inheritance in JavaScript? Make a pro's and con's list for each.

* _Bonus:_ Demonstrate your knowledge of each type of inheritance by writing a code for a `Mushroom` "class" that can be inherited from, and building a few instances such as `Shitake` and `Nightshade`.



###Closing Thoughts

* Would you typically put the methods or attributes in the prototype?
* When would we use static methods?

### Further Suggested Resources

- [Lynda.com's "What is object-oriented language" video](https://www.youtube.com/watch?v=SS-9y0H3Si8)
- [MDN's Introduction to Object-Oriented JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript)
- [MDN's Reference on Inheritance and the Prototype Chain](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain)
