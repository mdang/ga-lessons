# From Scary to Friendly

<img src="http://i.dailymail.co.uk/i/pix/2015/02/15/25B321FB00000578-2954536-Healing_a_broken_heart_Mickey_picked_up_the_two_pups_after_his_b-a-46_1424023876938.jpg" width=250px>

## With ES2015

Let's learn about some new features in ES6!

In today's exercise:

1. String Interpolation
2. Block Scope
3. Arrow Functions
4. Rest and Spread Parameters
5. Default Arguments
6. Import and Export

For each, you must uncomment the `require('./exercises/filename.js');` and work on the corresponding file.

## String Interpolation

Instead of adding variables together with strings, you can simply use embedded Javascript!

You can access other variables within your strings, even methods on those strings.

Ex:

``` javascript
var thing = "variable";

console.log(`Ceci n'est pas une ${thing.toUpperCase()}!`);
```



## Block Scope

`let` and `const` declare a block scoped variable. `const` also makes the variable a constant. JS will actually throw an error if you try and overwrite a `const` variable.

``` javascript
function varFoo() {
  var neilYoung = "Crazy Horse";
  if (true) {
    var neilYoung = "Crosby, Stills, Nash, and Young";  // same Neil!
    console.log(neilYoung);  // "Crosby, Stills, Nash, and Young"
  }
  console.log(neilYoung);  // "Crosby, Stills, Nash, and Young"
}

function letBar() {
  let zappa = "Hot Rats";
  if (true) {
    let zappa = "Jazz From Hell";  // different Zappa!
    console.log(zappa);  // "Jazz From Hell"
  }
  console.log(zappa);  // "Hot Rats"
}
```



## Arrow Functions

Arrow functions are a new and relatively cleaner way to write functions. You can use them anonymously or named, and if they have only argument, you don't need paranthesis! 

 Also, if used within another function, arrow functions will bind the context to the enclosing function!! No more need to use `var self = this;`!!!!

``` javascript
() => "No need to use the return keyword on one line functions!";

var beetlejuice = name => {
  return name.repeat(3);    	// String.prototype.repeat() HAS ALSO BEEN ADDED!
}								// THAT'S A BIG MEATBALL!
```



## Spread Operators & Rest Parameters

Spread Operator: The **spread operator** allows an expression to be expanded in places where multiple arguments (for function calls) or multiple elements (for array literals) are expected.

Rest Parameter: The **rest parameter** syntax allows us to represent an indefinite number of arguments as an array.

What this means: No need to mess with that awful `arguments` object ever. again.

Also, it means we no longer need `Function.prototype.apply()`, but we'll get to that next week…

``` javascript
function otherMotherVictims(...ghostChildren) {
  console.log(ghostChildren.length);
}

otherMotherVictims();  									// 0
otherMotherVictims("Margaret"); 						// 1
otherMotherVictims("Margaret", "Freddie", "Josephine"); // 3
```



## Default Arguments

In ES2015, we can now give default arguments within our functions. The latter arguments can even take from previous arguments!

``` 
var misconceptions = function(shark = "JAWS", bodyPart = shark.substring(0,3)) {
  var truth = "Not all sharks are " + shark;
  var lies = "Not all Travoltas have an enormous " + bodyPart;
}
```



## Import & Export

You can now import and export modules as well!

``` javascript
// --violent_j.js--
function getJSON(url, callback) {
  let xhr = new XMLHttpRequest();
  xhr.onload = function () { 
    callback(this.responseText) 
  };
  xhr.open("GET", url, true);
  xhr.send();
}

export function getUsefulContents(url, callback) {
  getJSON(url, data => callback(JSON.parse(data)));
}


// --shaggy_too_dope.js--
import { getUsefulContents } from "file.js";
getUsefulContents("http://www.example.com", data => {
  doSomethingUseful(data);
});
```

or:

``` javascript
// --violent_j.js--
function getJSON(url, callback) {
  let xhr = new XMLHttpRequest();
  xhr.onload = function () { 
    callback(this.responseText) 
  };
  xhr.open("GET", url, true);
  xhr.send();
}

function getUsefulContents(url, callback) {
  getJSON(url, data => callback(JSON.parse(data)));
}

export default {
  getUsefulContents: getUsefulContents,
  getJSON:           getJSON
}


// --shaggy_too_dope.js--
import Miracles from "file.js";
Miracles.getUsefulContents("http://www.example.com", data => {
  Miracles.doSomethingUseful(data);
});
```



## References

[ES2015 in 350 Bullet Points](https://github.com/bevacqua/es6)

[`tower-of-babel`](https://github.com/yosuke-furukawa/tower-of-babel)

[`count-to-6`](https://github.com/domenic/count-to-6)