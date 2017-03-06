# Training - Javascript Functions

Fork this repository to your GitHub account, then clone your GitHub copy onto your computer. Write the functions assigned below in the file `functions.js`. Use snippets to run and observe the results of your code.

## Setup

Here's how to use a snippet:

1. Open the Chrome Developer Console (Option + Command + I)
1. Navigate to the `Sources` tab in the Chrome Developer Console.
2. Click on the `Snippets` tab within the Sources display.
3. Right-click and choose `New` to create a new Snippets file.
4. Name the Snippets File `myFunctions`.
4. Write or paste code into the editing window and press `cmd` + `return` to run the code.

You'll be filling in a bunch of empty function definitions. Type each blank function definition into the snippet, then **you write** the rest of the code to make the function work.

After you implement a function successfully in your snippet, copy it over into the `functions.js` file.  Unless a different behavior is specified, have the function log the answer to the console AND return it.

Notice there is a solutions.js file. Make a full attempt at finishing these on your own and refer to the solutions only when you are finished or unbearably stuck. Also recognize that the solutions are only **one** solution and that there are many good ways to solve these problems.

For some of the problems, you'll have to use functions or other variables supplied by JavaScript's built-in `Math` object.  [Here is the documentation on using the `Math` object](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math).

**Example Usage of `Math`**
```javascript
	var absoluteValue = Math.abs(-4);
	// evaluates to 4

	var fourSquared = Math.pow(4, 2);
	// evaluates to 16

	var roundedToNearestInteger = Math.round(1.22343);
	// evaluates to 1
```


## Deliverable

When you wrap up work, edit this README to include your name, a link to the original repository, and a 3-5 sentence reflection on completing this assignment. Example:

> I was a able to complete all of the mathematical functions, but the string related functions were difficult for me. I spoke with the evening TA and she helped me solve the ASCII triangle function. I'm still feeling iffy on writing my own loops.

Push your updates to GitHub and add a link to the repo to the "My Work" section of your website!

## Function Definitions!


### 1.  Build your own concatenation
Return a new string that is the combination of two arguments passed into the function

**Example: `dog` and `house` will display `doghouse`**

```javascript
function combineWords(word1, word2) {
	// TODO: Place your code here
}

var result = combineWords('dog', 'house');
console.log(result);
// displays 'doghouse'
```

### 2.  Repeat a phrase
Display an argument phrase to the console n times

```javascript
function repeatPhrase(phrase, n) {
	// TODO: Place your code here
}

repeatPhrase("Hello", 5);
// displays
// Hello
// Hello
// Hello
// Hello
// Hello
```

### 3.  Build your own Power function
Return number <sup>power</sup> *without* using built-in `Math` functions

**Example**:   
**4<sup>5</sup> = 4 \* 4 \* 4 \* 4 \* 4 = 1024**

```javascript
function toTheNthPower(number, power) {
	// TODO: Place your code here		
}

var result = toTheNthPower(4, 5);
console.log(result);
// displays 1024
```

### 4. Area of a circle:  &pi; r<sup>2</sup>
Return the area of a circle given the radius  
[background information](http://www.mathgoodies.com/lessons/vol2/circle_area.html)

```javascript
function areaOfACircle(radius) {
	// TODO: Place your code here
}

var result = areaOfACircle(2);
console.log(result);
// displays approximately 12.57
```


### 5.  Pythagorean Theorem: a<sup>2</sup> + b<sup>2</sup> = c<sup>2</sup>
Return c given a and b  
[background information](https://en.wikipedia.org/wiki/Pythagorean_theorem)

```javascript
function pythagoreanTheorem(a, b) {
	// TODO: Place your code here
}

var result = pythagoreanTheorem(3, 4);
console.log(result);
// should display 5;
```

###  6. Is X Evenly Divisible by Y ?
Return a boolean value whether or not X can be divided by Y without any remainders.  

*Hint: Explore the world of Modulus operators!*

```javascript
function isXEvenlyDivisibleByY(x, y) {
	// TODO: Place your code here
}

var result = isXEvenlyDivisibleByY(99, 3);
console.log(result);
// displays true
```



### 7.  Vowel Count:
Return the number of occurrences of vowels in a word.
Vowels are `a`, `e`, `i`, `o`, `u`, and `y`

```javascript
function countVowels(word) {
	// TODO: Place your code here
}

var result = countVowels("stealing");
console.log(result);
// displays 3
```
*Challenge: Can you alter the code to count both upper case AND lower case?*

### 8. Does the array contain "wdi"
Given an array, return `true` if it contains the string "wdi" and `false` if it does not contain that string.

Example:

```javascript
findWdi([9,'Bart Simpson', true, 'wdi']) // returns true
findWdi(['a','b','c']) // returns false
```

```javascript

	function findWdi(arr){
		// TODO: Place your code here
	}

```

### 9. Build an ASCII Triangle!
Display a simple triangle with asterisks

**Example:   
printTriangle(5)**

```javascript
*
**
***
****
*****
```

```javascript
function printTriangle(length) {
	// TODO: Place your code here
}

printTriangle(3);
// displays
// *
// **
// ***
```

### 10. Stretch Challenge: Can you alter the printTriangle function to create a Pyramid?
**Example:  printPyramid(10);**

```javascript
           *
          * *
         * * *
        * * * *
       * * * * *
      * * * * * *
     * * * * * * *
    * * * * * * * *
   * * * * * * * * *
  * * * * * * * * * *
```

*Warning: This is a surprisingly tricky interview-level exercise.  Try at your own risk!*

```javascript
function printPyramid(length) {
	// TODO: Place your code here
}
```
