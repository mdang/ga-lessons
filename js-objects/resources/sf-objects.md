<!--
Creator: Cory Fauver
Market: SF
-->

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# Javascript Objects

### Why is this important?
<!-- framing the "why" in big-picture/real world examples -->

From [Eloquent JavaScript](http://eloquentjavascript.net/04_data.html):

>Numbers, Booleans, and strings are the bricks that data structures are built from. But you can’t make much of a house out of a single brick. Objects allow us to group values—including other objects—together and thus build more complex structures.

If we want to write code of any complexity, we are going to need to understand objects, how to create them, how to manipulate them, how to access data within them, and how to think about them.

### What are the objectives?
<!-- specific/measurable goal for students to achieve -->
*After this workshop, developers will be able to:*

- describe objects as collections of key value pairs.
- demonstrate the ability to access any attribute of an object in two ways - `.` syntax and `[]` syntax
- Display the difference between properties (attributes) and methods. Call an object's methods. Recognize the widespread presence of objects throughout JavaScript syntax (`console.log()`, `$('div').text()`, `string.length`)
- find and display an example of JSON on the web


### Where should we be now?
<!-- call out the skills that are prerequisites -->
*Before this workshop, developers should already be able to:*

- create and manipulate a JavaScript array.
- understand that variables store values by assigning them to names of our choosing.

### Review

1. Handwrite the syntax for creating an array that contains the number 5, the string 'wdi rocks', and the boolean `true` *in that order*.
2. Handwrite the syntax you'd use to access the string `wdi rocks` within that array.
3. Handwrite the way that you'd add the string 'Monday!' to the end of the list.
4. Handwrite the code you'd use to change the list value `true` to `false`.

## What is an Object?

![image](https://cloud.githubusercontent.com/assets/6520345/17868768/15cd042c-6865-11e6-87d8-2ebbd26ffbf4.png)

As of today, we have been writing our Javascript code using mainly functions, Strings, numbers, and Arrays. You've written functions that can print patterns of text, you've accessed the DOM with jQuery, and listened for events on the page. We haven't yet gathered a bunch of strings, numbers, arrays, and functions into a single collection of information. This is where objects come in. An object is **a collection of key-value pairs** that all have some sort of relationship and are connected logically to one another. Below is an example of an object.

``` javascript
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


In the line below, `wheels` is a **key** and `4` is its **value**. What are the other **key-value pairs**?

```javascript
wheels: 4;
```

Notice that **keys** are short, descriptive names just like variable names. Key-value pairs are essentially just variable names (keys) and their associated stored values. An object groups the information of many key-value pairs into a meaningful collection.

Notice that in our example, **values** are numbers, booleans, strings, and an array. These are all **attributes** (aka **properties**) of the object. They are the information that describes this object.


### Accessing the Data in an Object

#### Dot Notation
```javascript
// dot notation
var color = car.color; // blue
var wheelCount = car.wheels; // 4
var operational = car.inWorkingOrder; //true
```

#### Bracket notation

```javascript
// bracket notation
var color = car['color']; // blue
var wheelCount = car['wheels']; // 4
var operational = car['inWorkingOrder']; //true

// using bracket notation, you can lookup by variables
var accessString = 'currentSpeed';
var speed = car[accessString]; // speed will hold the value of car.currentSpeed
```

### Other Ways to Create an object

We can create the same car object by declaring an empty object and then filling it in with key-value pairs:

``` javascript
// dot notation
var car = {};
car.wheels = 4;
car.topSpeed = 110;
car.currentSpeed = 0;
car.color = 'blue';
car.inWorkingOrder = true;
car.damage = ['chipped windshield','dented back left bumper', 'passenger window squeaks'];
```

``` javascript
// bracket notation
var car = {};
car['wheels'] = 4;
car['topSpeed'] = 110;
car['currentSpeed'] = 0;
car['color'] = 'blue';
car['inWorkingOrder'] = true;
car['damage'] = ['chipped windshield','dented back left bumper', 'passenger window squeaks'];
```

Soon we'll learn other ways to build objects using special functions, called **constructors**, that build objects from an existing template.

## Changing an Object's properties
I don't know about you, but I generally like my cars yellow. I would also prefer a car with a top speed greater than 110!  Can we change our `car` object to better reflect my preferences? Absolutely!

``` javascript
car.color = 'yellow';
car.topSpeed = 210;
```

We just use the `=` to assign new values

![image](https://cloud.githubusercontent.com/assets/6520345/17868818/46b3cce2-6865-11e6-8bb4-94ebc63ceddf.png)

## Methods

An object can hold any data type - numbers, strings, booleans, arrays, functions, and even other objects.

Here's a less boring version of the `car` object that includes some **methods**.

``` javascript
var car = {
  wheels: 4,
  topSpeed: 110,
  currentSpeed: 0,
  color: 'blue',
  inWorkingOrder: true,
  damage: ['chipped windshield','dented back left bumper', 'passenger window squeaks'],
  accelerate: function(){
    if(this.inWorkingOrder && this.currentSpeed < this.topSpeed){
      this.currentSpeed += 10;
      return this.currentSpeed;
    }
  },
  brake: function(){
    if(this.currentSpeed > 0){
      this.currentSpeed -= 10;
      return this.currentSpeed;
    }
  }
}
```

**Methods** are the functions that an object can perform! If we want our object to be able to do things, it will need **methods**.

Methods can also access properties within the object with the `this` identifier rather than using dot or bracket notation.  Remember, `this` refers to the "container" in which the function is being executed. Previously, our only "container" was the `window` object. Now that we're putting methods inside of our own custom objects, `this` takes on the value of the object that surrounds it.


#### Methods Can Only Be Called With Dot Notation
```javascript
// methods can only be called with dot notation
car.accelerate(); // car.currentSpeed is now 10
car.accelerate(); // car.currentSpeed is now 20
car.accelerate(); // car.currentSpeed is now 30
car.brake(); // car.currentSpeed is now back to 20
console.log(car.currentSpeed); // will print 20
```

## Create Objects!

Go to terminal, run `node` and generate a car object directly in the code. Include all of the properties that I have used above and add at least 5 attributes of your own. Write one method that is unique to your car object.

## Objects are Everywhere!

Objects are all over JavaScript syntax. Look throughout the JavaScript code we've encountered so far, look for the dot notation. Find three examples of objects in normal JavaScript syntax. Include your evidence for why your example is definitely an object.


## Accessing Data from an Object

Below is a truncated version of our cohort data. The `data` object is a grouping of key -value pairs that describe our class.  Take some time to study the structure and the data types within the data object. It's a bit more complex.

```javascript
var data = {
	school: "General Assembly",
	city: "San Francisco",
	course: "Web Development Immersive",
	course_id: "WDI34",
	classroom: "7",
	students: [{
		id: 124140,
		lastName: "Silva",
		firstName: "Greice"
	}, {
		id: 421124,
		lastName: "Arellano",
		firstName: "Ricardo"
	}, {
		id: 824544,
		lastName: "Cusimano",
		firstName: "Zach"
	}]
}

```


<details>
  <summary>What data type is the value associated with the `students` key in the `data` object?</summary>
  <p>
  The `students` attribute is an array!
  </p>
</details>

<details>
  <summary>What data type are the elements within `students`?</summary>
  <p>
    They are objects!
  </p>
</details>  

<details>
  <summary>What data type are the elements within `students`?</summary>
  <p>
  The `students` array contains objects as its elements!
  </p>
</details>

To access a property, we can use dot-notation or bracket-notation on the key to have the corresponding value returned.

How would you access the `students` attribute of the `data` object?

<details>
  <summary>How would you access the `students` attribute of the `data` object?</summary>
  <p>
  ```javascript
  data.students
  ```
  </p>
</details>



To access an array within an object,  the method is similar to accessing any other property.  The property `students` is an array of Objects.  To access that array and assign it to a variable, we simply perform the following:

 ```javascript
 var studentArray = data.students; //students
 ```
The `data.students` array is now accessible by using `studentArray` instead. We can access the first array element using bracket notation:  `studentArray[0]` or `data.students[0]`.


<details>
  <summary>How would you access Zach's data from within the `data` object?</summary>
  <p>
  ```javascript
    data.students[2]
  ```
  </p>
</details>

<details>
  <summary>How would you access Ricardo's student id?</summary>
  <p>
  ```javascript
    data.students[1].id;
  ```
  </p>
</details>


<details>
  <summary>How would you access Greice's last name?</summary>
  <p>
  ```javascript
    data.students[0].lastName;
  ```
  </p>
</details>

## JSON

JSON stands for **JavaScript Object Notation**. It is a standard for communicating information across the internet. JSON is data formatted to look like JavaScript objects, with just a few small quirks. Most importantly, JSON stores all of the key names as strings. Here is an example of [some JSON on the web](https://api.spotify.com/v1/search?q=demon%20days&type=album).

You can see that this is a HUGE object with tons of data. It is the result of searching Spotify's albums for the string "demon days".

To make this all a bit less overwhelming, download the [JSON viewer Chrome plugin](https://chrome.google.com/webstore/detail/json-viewer/gbmdgpbipfallnflgajpaliibnhdgobh), which will help you collapse and expand sections of the data as needed.

![image](https://cloud.githubusercontent.com/assets/6520345/20900116/f2c101c0-bae1-11e6-80a7-d654c2cde2dd.png)


<details>
  <summary>Challenge: Assuming the whole JSON is named `data`, access the URL of the first image from the first search result from this piece of JSON.</summary>
  <p>
  ```javascript
    data.albums.items[0].images[0].url;
  ```
  </p>
</details>


#### Note: Arrays are special objects! An array is an object with numerical keys.

## Independent Practice
Refine the skills covered in this workshop with this [training](https://github.com/sf-wdi-34/js-objects-training).

## Closing Thoughts
- We're going to be using objects heavily this week in inspecting JSON. If accessing specific properties of an object is feeling challenging, practice in the terminal using node's REPL. Create an object and then try to access a specific property.
- Take 2 minutes to write down everything you know about objects without looking at any other resources.

## Additional Resources
- [Eloquent JavaScript's Objects and Arrays chapter](http://eloquentjavascript.net/04_data.html)
- [MDN's working with objects](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Working_with_Objects)
- [Examples of JSON](http://json.org/example.html)
