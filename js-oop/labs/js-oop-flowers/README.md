#Object Oriented Programming

| Objectives |
| :--- |
| Build practical and useful objects using Javascript constructors |
| Demonstrate a working knowledge of  object properties and methods  |
| Convert previous projects to utilize Object Oriented Programming techniques |

## What is an Object?

As of today, we have been writing our Javascript code using mainly functions, Strings, numbers, and Arrays.   This has allowed us to parse through data objects given to us, reach out and pull data from the internet, and display it all on a web page!  These are all great accomplishments, but like everything else in the world of programming, there is always a more efficient way of implementing what we have done.

Here's a truncated version of data about this cohort.  Take some time to study the structure and the data types within the data object.

```javascript
var data = {
	school: 'General Assembly',
	city: 'San Francisco',
	course: 'Web Development Immersive',
	course_id: 'WDI30',
	course_alias: 'Dirty Thirty'
	classroom: '5',
	students: [{
		id: 0,
		last_name: 'Brown',
		first_name: 'Matthew',
		github_username: 'matterericbrown'
	}, {
		id: 1,
		last_name: 'De La Cruz',
		first_name: 'James',
		github_username: 'jamesdlc'
	}, {
		id: 2,
		last_name: 'Duong',
		first_name: 'Tiffani',
		github_username: 'tbduong'
	}]
}


```

-  Based on our experience in class so far and your familiarity with the above object, consider the following as you read further:
	- How many of the attributes in `data` are Strings? 
 	- How many of the attributes are Arrays?
 	- If there is an array, what data type(s) are the elements inside?

The `data` object is a grouping of key & value pairs (known as properties) that describe our class.  
  
```javascript 
school: 'General Assembly'
```
In the line above, `school` is the **key** and `'General Assembly'` is the **value**.
 
To access a property, we can use dot-notation or bracket-notation on the key to have the corresponding value returned.
 
 ```javascript
 var GA = data.school; //General Assembly
 ```
 
`GA` has the value `General Assembly`.  
 
To access an array within an object,  the method is similar to accessing any other property.  The property `students` is an array of Objects.  To access that array and assign it to a variable, we simply perform the following:
 
 ```javascript
 var studentArray = data.students; //students
 ```
The `data.students` array is now accessible by using `studentArray` instead.
Declaring variables and defining them as portions of a larger object helps us create readable and followable code.  

*We can assume that an Object is a collection of properties (key & value pairs) that all have some sort of relationship and are connected logically to one another.*  

###Quick Challenge
<!--- Make a copy of `data.js` and rename it to `enhancedData.js`-->
- Make a copy of the cohort data
- Add some more properties that logically fit into an object describing our class (address, floor number, and a list of instructors).
- Try to access your new data properties from the console to make sure they work.

If everything worked out, you should have a fully functioning data object, only now with even MORE properties with us to play with!  


##Creating an object
For relatively straightforward and small objects, it is perfectly fine to declare them as a variable and define them, as we did with the data about a cohort.  This is known as a *Literal* object definition.  
Here. I'll make you a flower using the *Literal* method:

```javascript
// Literal Object Definition
var flower = {
	color : 'red',
	petals : 32,
	smellsPretty : true
};
``` 

 Now let me make you a flower using the preferred *Constructor* method:
 
 ```javascript
 // Constructor Object Definition
 function Flower(){
 	this.color = 'red';
 	this.petals = 32;
 	this.smellsPretty= true;
 }
 ```

The Literal definition of an object creates one single object called flower.  There are no other flowers, just that one single object we created.  The constructor method is actually a function that creates a unique object every time it is called.  Below we will create a new variable `rose` that will use the constructor method to create a new object.

```javascript
var rose = new Flower();
```

Let us break down a couple concepts introduced with this new line of code:
- The capitalization of `Flower` lets everyone know that `Flower` is an object constructor.  Calling `Flower()` will return a `Flower` object.
- The `new`before our function call lets javascript know that we are creating a new object that will be independent of any other object.
- We call the flower function, which creates an object with the three pre-defined properties already made.  Our object is ready to go!

<img src = http://www.mzephotos.com/wallpapers/roses/red-rose-1024x768.jpg width = 75%>

Accessing the properties of our new `rose` object is the same as accessing our properties from any other object: we use dot or bracket notation.

```javascript
var color = rose.color; // red
var petalCount = rose.petals; // 32
var smellsNice = rose.smellsPretty; //true
```

If we wanted to create yet ANOTHER flower, all we have to do is call our function just like we did above.  This time, lets make an object called `lily`.

```javascript
var lily = new Flower();
```

We can access the properties of `lily` in the same manner as we did with `rose`.

```javascript
var color = lily.color; // red
var petalCount = lily.petals; // 32
var smellsNice = lily.smellsPretty; //true
```

##Changing an Object's properties
I don't know about you, but I generally like my Lillies yellow. I have also never heard of a lily with 32 petals, holy smokes!  Can we change our `lily` object to better reflect my perfect lily? You bet!

```javascript
// Changing object property values
lily.color = 'yellow';
lily.petals = 6;
```

That's more like it!  To change the value of the lily object properties. we simply access them with dot or bracket notation.  We then follow with an equals and a new appropriate value.  Couldn't be easier!

<img src = https://seniorhikerphotos.files.wordpress.com/2012/06/lilysarina12052301.jpg width = 75%>

##Object Methods
One of the most powerful features of Javascript Objects are Methods.  Methods are *'functions'* that are predefined and built into an object.  We all know and love array Methods like `forEach()`, `map()`, `filter()`, and `reduce()`; these are all Methods of the Array object.  We use arrays so much that Javascript automagically creates them from an Array constructor without us having to instantiate them with `new` like we did above with the flowers.  Thanks, Javascript!

Lets make a simple method in the flower object that outputs to the console whenever we call it.  

```javascript
function Flower(){
    this.color = 'red';
    this.petals = 32;
    this.smellsPretty= true;
    
    // Demonstrates a simple method in an object
    this.sniff = function() {
       console.log('Sniff Sniff Sniff!');
    };
}
```

We now have a method inside our flower object called `sniff`.  When we call it, the console will display 'Sniff Sniff Sniff!' as predicted.  

###Methods with Arguments
Lets add another method that takes an argument and returns a response.  Methods can also access properties within the object with the `this` identifier rather than using dot or bracket notation.

```javascript
function Flower(){
    this.color = 'red';
    this.petals = 32;
    this.smellsPretty= true;

    // Demonstrates a simple method in an object 
    this.sniff = function() {
        console.log('Sniff Sniff Sniff!');
    };
    
    // Demonstrates use of arguments with methods
    this.growPetals = function(newPetals) {
    	this.petals += newPetals;
    	console.log('This flower has grown to have a total of ' + this.petals + ' petals!');
    	return this.petals;
    };
}

```

###Methods with 'quality' return values
  We can also add a return value of an object's property to the `sniff` method to add to it's utility. We can return the smellsPretty boolean value! That's handy!
		

```javascript
function Flower(){
    this.color = 'red';
    this.petals = 32;
    this.smellsPretty= true;
    
    // Demonstrates a simple method in an object 
    this.sniff = function(){
        console.log('Sniff Sniff Sniff!');
        return this.smellsPretty;
    };
    
    // Demonstrates use of arguments with methods
    this.growPetals = function(newPetals) {
    	this.petals += newPetals;
    	console.log('This flower has grown to have a total of ' + this.petals + ' petals!');
    	return this.petals;
    };
    
    // Demonstrates use of local object variables
    this.describe = function() {
        alert('This flower is ' + this.color + ' and has ' + this.petals + ' petals.');    
	  };
}
```

###Quick Challenge - She loves me, she loves me not...
Create an object method for flower that will play the age old game ['He loves me, he loves me not...'](https://en.wikipedia.org/wiki/He_loves_me..._he_loves_me_not)
- Count down from the petal number down to 1
- Alternately display 'He loves me' or 'He loves me not' to the console for each petal count decrement.
- Display the final phrase with an exclamation; that's the end of the game!


There are many more aspects to objects that we will discover soon.  For now, play with objects and think up some great object examples that we might use in class.

PS. Here is the Literal equivalent of the flower constructor with all of the methods intact:

```javascript
var flower = {
    color: 'red',
    petals: 32,
    smellsPretty: true,
    sniff: function(){
        console.log('Sniff Sniff Sniff!');
    },
    // Demonstrates use of arguments with methods
    growPetals : function(newPetals) {
        this.petals += newPetals;
        console.log('This flower has grown to have a total of ' + this.petals + ' petals!');
        return this.petals;
    },
    // Demonstrates use of local object variables
    describe: function() {
    	alert('This flower is ' + this.color + ' and has ' + this.petals + ' petals.');    
  	}
}
```

Further Suggested Reading:
- [MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript)
- [Tutsplus](http://code.tutsplus.com/tutorials/the-basics-of-object-oriented-javascript--net-7670)
