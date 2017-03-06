
# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) Functions (90 mins)

| Timing | Type | Topic |
| --- | --- | --- |
| 5 min | [Opening](#opening) | Intro Video |
| 10 min | [Intro to New Material](#intro-to-functions) | Functions |
| 10 min | [Guided Practice](#function-expressions) | Function Expressions |
| 15 min | [Guided Practice](#arguments-and-parameters) | Arguments and Parameters |
| 10 min | [Guided Practice](#return-values) | Return Values |
| 15 min | [Intro to New Material](#scope) | Variable Scope |
| 15 min | [Independent Practice](#write-functions) | Write Some Functions |
| 5 min | [Conclusion](#conclusion) |Q&A |

### LEARNING OBJECTIVES
*After this lesson, you will be able to:*

- Describe why functions are useful.
- Differentiate between function declarations and function expressions.
- Describe how parameters relate to functions.
- Explain how return statements are used in JavaScript.
- Compare global and local scope.


### STUDENT PRE-WORK
*Before this lesson, you should already be able to:*

- Create variables in JavaScript.
- Differentiate between data types (strings, numbers, booleans).
- Use conditionals to control program flow based on boolean conditions.
- Create and manipulate arrays.
- Use loops to iterate through the elements in an array.


---
<a name="opening"></a>
## Opening (5 mins)
- Review current lesson objectives

In the last couple of lessons we looked at how we can control the flow of a program by using conditional statements and loops, and after that, you probably noticed how quickly a program can grow in length and complexity.

In this lesson we'll be taking a look at how we can use functions to group together statements that perform a specific task and reduce repetition in our programs.

Take a look at this short [video](https://generalassembly.wistia.com/medias/qmhj5hv27i) that provides an overview of how functions are useful in our programs.



---
<a name="intro-to-functions"></a>
## Introduction to Functions (10 mins)
**Function** is a term that comes out of mathematics. You may remember hearing it in your high school algebra class.

The basic idea of a function is simple — it's a relationship between a set of inputs and a set of outputs.

Take a look at the relationship between variable `x` and function `f` in this example.

Function `f `takes the input `x` and spits out a single output ( `f(x)` ).

Can you guess what this function does to the value of `x`?

![](http://circuits-assets.generalassemb.ly/prod/asset/4416/Slide-5-Funnel-Chart.svg)

If you guessed "multiplies `x` by 2," you're right!


#### Why are functions useful?

In JavaScript, a function can be:

1. Made up of either a single reusable statement or a group of reusable statements.
2. Called from anywhere in the program, which allows for the statements inside a function to not be written over and over again.

Functions are especially useful because they enable a developer to segment large, unwieldy applications into smaller, more manageable pieces.

#### Example of using a function

Here's an example of what a function can do:

If you've watched enough Matt Damon movies, you may have noticed that the government often spends a lot of time and money to go save his characters.


![maaaaatt daaaamon](http://circuits-assets.generalassemb.ly/prod/asset/5031/matt-damon.jpg)



Even if you haven't watched a single Matt Damon movie, take our word for it — the guy can't keep himself out of trouble.

Now let's take a look at a program that breaks down some of Matt Damon's movies and their respective rescue costs.



As you can see from the code, a director only wants to save Matt Damon if the cost is less than a 1000 dollars.

This then repeats for every additional movie.

```js
var movie = "Saving Private Ryan";
var cost = 100;
if (cost < 1000) {
	console.log(movie + " director says LET'S RESCUE MATT DAMON!");
} else {
	console.log(movie + " director says FORGET MATT DAMON!");
}

var movie = "Interstellar";
var cost = 2000;
if (cost < 1000) {
	console.log(movie + " director says LET'S RESCUE MATT DAMON!");
} else {
	console.log(movie + " director says FORGET MATT DAMON!");
}

var movie = "The Martian";
var cost = 700;
if (cost < 1000) {
	console.log(movie + " director says LET'S RESCUE MATT DAMON!");
} else {
	console.log(movie + " director says FORGET MATT DAMON!");
}

```


This is all easy enough to write out, but because Matt Damon has been in so many movies where he needs to be rescued, this code is going to get pretty lengthy!

Let's try to keep our code from getting out of hand by using a function.


```js
var mattDamon = function (movie, cost) {
	if (cost < 1000) {
		console.log(movie + " director says LET'S RESCUE MATT DAMON!");
	} else {
		console.log(movie + " director says FORGET MATT DAMON!");
	}
}

mattDamon("Saving Private Ryan", 100);
mattDamon("Interstellar", 2000);
mattDamon("The Martian", 700);
mattDamon("Elysium", 200);

```


Notice how much cleaner and simpler this function looks than our repeated lines of code?

Now if Matt Damon decides to film more movies where he needs to be rescued, all we have to do is type:

```js
mattDamon("movieTitleHere", costHere)
```

Using functions is a great way to save time for yourself, and simplify things for your team members.

#### DRY - Don't repeat yourself
Functions are a critical component of programming because they allow us to execute on a key tenant of engineering:

"**D**on't **R**epeat **Y**ourself" (aka "DRY" code).

Our goal is to craft our programs in as few lines of code as possible, while still being clear.


##### Why should we avoid repetition?

1.  **Performance -** Having repeated code will lead to longer scripts. Longer scripts take up more memory and will take more time to load, which can make a website seem slow.

2.  **Maintainability -** Imagine that we have the same line of code repeated 10 times in our program. If we ever want to change that functionality, we would have to search for all 10 places where that code is repeated and make 10 individual changes.



#### Why use functions - Summary
Let's review the three main reasons that functions are created:

![](http://circuits-assets.generalassemb.ly/prod/asset/5016/Slide-17-Chart.svg)




---
<a name="function-expressions"></a>
## Function Expressions (10 mins)
Now we know what functions are and why we use them. But how do we create them?

As you saw in our Matt Damon Rescue example, just as we do with a variable, we must define a function before we call or "use" it.

In JS, functions can be defined in several ways. Two of the more common methods of defining a function are **function declaration** and **function expression**.

#### Function Expressions - Overview
Let's take a look at **function expressions** first.

A **function expression** defines a function by producing a value that's stored in a variable.

This is similar to the way an expression produces a value that's stored in a variable—hence its name.

![](http://circuits-assets.generalassemb.ly/prod/asset/4421/Slide-19.svg)


Have you ever tried to move forward to the next page of an online form, only to be greeted by an alert that says "Please fill out all the required fields"?

This kind of code can be placed in a function and this function can be called anytime the user hasn't filled out a field on any form on the site. Let's code for this popup alert using a function expression:

![](http://circuits-assets.generalassemb.ly/prod/asset/5049/code_block_1.png)


Let's take a look at the function in more detail:

  1. The first line begins by declaring a variable called `errorAlert`. This is the name that we can then use to call that function.
  ![](http://circuits-assets.generalassemb.ly/prod/asset/5050/code_block_2.png)
  2. This is followed by the word `function`, which is a keyword we use to let JS know that we are creating a function.
  ![](http://circuits-assets.generalassemb.ly/prod/asset/5052/code_block_3.png)
  3. Next, you have a list of parameters surrounded by parentheses. Even though the parameters that can go within the parentheses are optional, the parentheses themselves are _always_ required.
  ![](http://circuits-assets.generalassemb.ly/prod/asset/5053/code_block_4.png)
  4. The statements inside the function will run every time the function is called. The function body must always be wrapped in curly braces `{ }`, even when it consists of only a single statement.
  ![](http://circuits-assets.generalassemb.ly/prod/asset/5054/code_block_5.png)

#### Naming Conventions
Now that we've learned about function expressions, let's discuss naming conventions.

You may have noticed how we capitalize names in JavaScript using the camelCase style.

<img src="http://circuits-assets.generalassemb.ly/prod/asset/4427/Slide-25-Camel.svg" width="350px">

Let's take a quick look at some good and bad examples of function names, and what can cause them to break down:

*   **Bad:** `thisfunctioncalculatestheperimeterofarectangle`  
    (no camelCase, too verbose)

*   **Bad:** `my new function`  
    (contains spaces)

*   **Bad:** `myNewFunction`  
    (doesn't explain what it does!)

*   **Good:** `calculateArea`  
    (describes what it does, short, and uses camelCase)

#### Calling a function
To run the code in a function, we **call**, or invoke, the function by using the function name followed by parentheses.

```js
pickADescriptiveName();
```

The code in a function will not run when the function is defined. The code will only run when the function is called.

#### Exercise - Cat Talk
1.  Write a function `catTalk`.
2.  Inside the function, log "Meow" to the console. [Hint: add `console.log();`]
3.  Call the `catTalk` function. [Hint: make sure you use parentheses]
4.  Check your console to make sure "Meow" is displayed.

Great job!

#### Exercise - Area

1.  Write a function `area`.
2.  Within the function:
  *   Declare a variable `width` and give it the value of 5.
  *   Declare a second variable `length` and give it the value of 3.
  *   Log `width * length` to the console.
4.  Call the `area` function.
5.  Check your console to make sure 15 is displayed.

Great job!


---
<a name="arguments-and-parameters"></a>
## Arguments and Parameters (15 mins)

Now that we know how to call functions, let's see how we can add more details to our functions through parameters and arguments.

#### Why are arguments and parameters useful?
Earlier in the lesson, we created a function that calculated the area for a space with a width of 5 and length of 3.

```js
var area = function () {
  var width = 5;
  var length = 3;
  console.log(width * length);
}

area();
```

What would we do if we also wanted to find the area of our kitchen, a room that is 12 feet wide and 16 feet long?

We could create another function for that area:

```js
var kitchenArea = function () {
  var width = 12;
  var length = 16;
  console.log(width * length);
}

kitchenArea();
```

What if we wanted to find the area of all the rooms in our house?

We don't want to have to create a separate function for each room — that's a lot of work on our end.

It will also burden our program with repeated code, which we want to avoid.

Remember, keep it DRY! (Don't Repeat Yourself).

![](http://circuits-assets.generalassemb.ly/prod/asset/4430/Slide-6-Mansion.svg)

Wouldn't it be nice if we had some way to provide the area function with the information it needs to calculate the area for any given space?

In this lesson, we'll take a look at how we can do just that using **parameters**.


#### Syntax - Parameters and Arguments
**Parameters** are the names listed in the function definition.

Let's take a look at how we can provide our `area` function with a width and a length for each room so we won't need to create a separate function every time we want to measure the dimensions of a new room.


![](http://circuits-assets.generalassemb.ly/prod/asset/4432/Slide-9-Parameter.svg)


![](http://circuits-assets.generalassemb.ly/prod/asset/4433/Slide-10-Width-Length.svg)


![](http://circuits-assets.generalassemb.ly/prod/asset/4435/Slide-11-Arguments.svg)


![](http://circuits-assets.generalassemb.ly/prod/asset/4436/Slide-12-Arguments.svg)

To write functions with more than one parameter, use a comma separated list:

e.g., (parameter1, parameter2, parameter3, parameter4, etc.)

Here is an example of a function with four parameters:

```js
var greetUser = function(firstName, lastName, year, city) {
  console.log("Hello " + firstName + " " + lastName + " born in "+ year + " from " + city + "!" );
}
```

> Check: What would happen if we called the function with the following arguments?

```js
greetUser("Bruce", "Wayne", 1939, "Gotham");
```

> Answer: We would get this result:

```js
    => "Hello Bruce Wayne born in 1939 from Gotham!"
```

#### Exercise: - Disney
Let's review parameters and arguments:

![](http://circuits-assets.generalassemb.ly/prod/asset/5017/Slide-16-Chart.svg)

1.  Create a function named `disney`.
2.  It should accept two parameters, `villain` and `movie`.
3.  The function should take the parameters and log the result to the console saying "{villain} is the meanest character in {movie}."
4.  Now, call that function, passing in `Ursula` and `The Little Mermaid` as the arguments.
5.  Check the console to make sure the correct sentence is displayed!

Great job!


---
<a name="return-values"></a>
## Return Statements (10 mins)
We now know how to communicate with functions in one direction, by passing values to functions using parameters and arguments.

But, functions can also communicate back to you and return values.

#### Why use return statements?

Sometimes we don't necessarily want to show or log something immediately to the console, or update something on the page.

Instead, we might just want to update a variable within a function, or even call another function without showing its effects.

To do this, we use a `return` statement.


Let's look at an example of updating a variable within a function.

```js
// Here this function "spits out" the sum of the parameters x and y
var sum = function (x, y) {
  return x + y;
}

// We then save that sum to the variable totalSum.
var totalSum = sum(3, 4);
=> 7
// The variable totalSum will now hold the value 7.
```

The `return` statement _stops the execution of a function_ and returns a value from that function.

#### Storing a return value in a variable

When we `return` something, it ends the function's execution and "spits out" whatever we are returning.

We can then store this returned value in another variable.

```js
function addBonusPoints (score) {
    if (score > 50) {
        return score + (score * .10);
				// if score is 50, then 60.5 will be returned
    }

    return score;
}

var totalPoints = addBonusPoints(55);
// The variable totalPoints will now hold 60.5
```

1. Because the score in this case is greater than 50, we will hit the return statement `return score + (score * .10);` and the function will stop running after that point.
2. This means that the code inside the function block that is below the `return` statement will never be executed and will be ignored completely.

Pretty powerful, right?

#### Exiting a function

We can also use `return;` by itself as a way to exit the function and prevent any code after it from running.

Take a look at this example:

```js
var rockAndRoll = function (muted) {
   var song = "It's only Rock 'N' Roll";
   var artist = "Rolling Stones";

   if (muted === true) {
       return; // Here we use return as a way to exit a function, instead of returning any value
   }

    console.log("Now playing: " + song + " by " + artist);
}

rockAndRoll(true);
```

Here, we use `return;` as a way to exit the function instead of returning any value.

So when we call the function passing in `true` as an argument for `muted`, this statement will never run:

```js
console.log("Now playing: " + song + " by " + artist);
```


---
<a name="function-declarations"></a>
## Function Declarations (10 mins)
Now we'll take a look at another way to define functions (**function declarations**) and how these differ from the function expressions we've been using.

Watch this short [video](https://generalassembly.wistia.com/medias/g1w03wkvth) for an overview of Function Declarations and Function Expressions.


#### Function Declarations vs. Function Expressions
Remember the `mattDamon()` function?

(Of course you remember, how can you forget a function that decides to "FORGET MATT DAMON"?!)

Let's take a look at how we could rewrite that function as a **Function declaration** by changing the way we declare the function (the bottom example).

![](http://circuits-assets.generalassemb.ly/prod/asset/5030/Slide-5-var-function-Matt-Damon.svg)

Both functions do the exact same thing, they're just written differently. We'll take a look at the difference between the two in just a few minutes.

#### Syntax
As you can see, a function declaration always has:

*   The keyword `function`.
*   A descriptive name that refers to the function (this can be anything you want, as long as it's in camelCase).
*   An optional list of parameters surrounded by parentheses.

<img src="http://circuits-assets.generalassemb.ly/prod/asset/4535/Slide-9-Function-Declaration-New.svg" width="400px">

#### Hoisting
Right now, let's dive deeper into the differences between function declarations and function expressions. While both methods are similar, one of their main differences is the concept of **hoisting**.

In JS, function declarations are always moved, or "hoisted," to the top of their scope by the interpreter. (Remember, the interpreter is the console in JS — the software that runs the code).

In other words, _you can call a function declaration before defining it_.

Let's look at an example of hoisting:

![](http://circuits-assets.generalassemb.ly/prod/asset/5022/Slide-13-Hoisting-Chart.svg)


#### Named vs. Anonymous Functions

Function declarations are often referred to as **named functions** because, in order to be able to call a function declaration, we must give it a name after the keyword `function()`.

Function expressions are often referred to as **anonymous functions**, because the name of the function is omitted after the keyword `function()` and therefore the function itself doesn't have a name &mdash; hence, it's considered "anonymous."


#### Real-world Developers
Now that you're familiar with both ways of declaring and assigning functions, you can choose which one works best for you.

Let's watch a [video](https://generalassembly.wistia.com/medias/exsv54zfg9) on how programmers choose their favorite method.


---
<a name="scope"></a>
## Variable Scope (15 mins)
You already have some experience using both function expressions and function declarations with parameters and arguments.

Now, we're going to take a look at one of the complexities that comes with using functions — **variable scope**.

We'll also dig deeper into how we can use our newfound knowledge of scope to make our scripts run faster and avoid variable naming conflicts.

#### Global vs. Local Scope
Watch this short [video](https://generalassembly.wistia.com/medias/bffc1s0pkf) for an overview of local vs. global variables and a helpful analogy to remember the difference between the two.

In JavaScript, where you declare a variable affects where that variable can be used within your code.

When we declare variables inside a function, those variables will only be accessible from within that function. This is known as **scope**.

You can think of the **scope** as the lifetime of the variable (where in the program the variable is born and where it dies or is discarded).

Let's look at the two different types of scope: **global** and **local**.

#### Global Variables
Before you even write a line of JavaScript, you're in what is known as the **global scope**.

When a variable is declared **outside a function**, it is referred to as a **global variable**. A global variable has global scope, which means _all scripts and functions on a web page can access it_.

Let's take a look:

![](http://circuits-assets.generalassemb.ly/prod/asset/5015/Slide-7-Annotated.svg)

#### Local Variables
Conversely, if a variable is declared inside a function, it is local to that function and therefore referred to as a **local variable**.

This also means it has **local scope**. When we have a variable with local scope, _it cannot be referenced outside of that function_, which means it cannot be called or used outside of the brackets in which it's contained.

```js
var sayHello = function () {
	var brother = "Bill";
	console.log("Hello " + brother);
}

sayHello();

```

Notice how the variable `brother` is now defined from _within the function_?  
This means it is now a local variable and can only be accessed from within that function.

#### Memory Usage

Another difference between global and local variables is the use of memory.

Every variable takes up memory. The more memory our script requires, the slower our web page.

Let's take a look at how local and global variables use memory differently.

##### Local Variables
The interpreter creates local variables when it runs a function and removes them right after that function finishes running.

##### Global Variables
Global variables, on the other hand, are stored in the processor's memory for as long as the page is loaded in the browser.

As a result, global variables can be inefficient, because they will continue to take up memory space even when they are not actually in use.


<img src="http://circuits-assets.generalassemb.ly/prod/asset/4457/Slide-13-Global-vs-Local.svg" width="500px">

> Instructor Note: Ask one student what their student ID number from college/high school is (they most likely will not remember). Then ask another student what their last name is. Explain how there are pieces of information that are only relevant for a certain period of time (like a student ID is only relevant during college), whereas some pieces of information are always relevant and need to be remembered during all stages of life (like a last name).

<br>

> For JavaScript (before JavaScript 2015), local variables are scoped by their enclosing function. JavaScript 2015 is introducing lexical scope for variables declared with the `let` keyword.

<!--@sarahholden TODO: Build out a bit more content about the new ES6 syntax -->

#### Check: Turn and Talk
Turn to a partner and discuss the following:

1. Summarize the difference between global and local variables (bonus: think of an analogy!)
2. When would you want to use a global variable? A local variable?


#### Naming Conflicts
As you begin coding, you'll find that a typical project can contain thousands of lines of code.

When working on a project with several developers, there is a high probability that two developers might use the same name for variables, which will result in a naming conflict.

You can imagine how easy it can be to accidentally give two variables the same name and overwrite the value of one with the other.


##### Avoiding naming conflicts by using local variables
Luckily, by declaring local variables, we are able to avoid these kinds of naming collisions.


As local variables are created when a function runs and then deleted from memory right after that function stops running, two different functions can use local variables with the same name without any sort of naming conflict.

```js
var sayHello = function() {
  var sister = "Jane"; // this is created when function runs, deleted immediately after
  console.log("Hello " + sister);
};

var sayGoodbye = function() {
  var sister = "Sue"; // this is created when function runs, deleted immediately after
  console.log("Goodbye " + sister);
};
```

##### Global Variables and naming conflicts
Conversely, when using global variables, our variables are stored in memory as long as a web page is loaded. This makes it easy to accidentally overwrite the value of one variable with another.

For example:

```js
var sister = "Jane";
var sayHello = function() {
  console.log("Hello " + sister);
}

// Later in our script...

var sister = "Sue"; // Oops! We forgot that we already had a variable sister and we overwrote it here.
var sayGoodbye = function() {
  console.log("Goodbye " + sister);
}
```
<a name="write-functions"></a>
## Independent Practice - Write some functions (10 mins)

Work through as many of these exercises as you can within the next 10 mins.

1. Write a function `lengths` that accepts a single parameter as an argument, namely an array of strings. The function should return an array of numbers where each number is the length of the corresponding string.

	```javascript
	var words = ["hello", "what", "is", "up", "dude"]
	lengths(words)  # => [5, 4, 2, 2, 4]
	```

2. Write a Javascript function called `transmogrifier`. This function should accept three arguments, which you can assume will be numbers. Your function should return the "transmogrified" result.

	The transmogrified result of three numbers is the product of the first two numbers, raised to the power of the third number.

	For example, the transmogrified result of 5, 3, and 2 is `(5 times 3) to the power of 2` which will evaluate to 225. Use your function to find the following answers.

	```javascript

	transmogrifier(5, 4, 3)
	transmogrifier(13, 12, 5)
	transmogrifier(42, 13, 7)

	```

3.  Write a function `wordReverse` that accepts a single argument, a string. The method should return a string with the order of the words reversed. Don't worry about punctuation.

	```javascript
	wordReverse("Now I know what a TV dinner feels like")
	// => "like feels dinner TV a what know I Now"
	wordReverse("Put Hans back on the line")
 	// => "line the on back Hans Put"
	```



<a name="conclusion"></a>
## Conclusion (5 mins)
In this lesson we discussed a key concept of programming  —  **Don't Repeat Yourself**. Our goal is to craft our programs in as few lines of code as possible, while still being clear.

By using functions we can group steps, create code that is reusable, and easily store steps.

Watch this short [video](https://generalassembly.wistia.com/medias/iv72hmwzam) with a case study from a real-life developer on when he would use functions.

In the next lesson, you'll learn more about objects, a key to making JS much more efficient. Objects will take your JS programming skills to a whole new level.

***

### ADDITIONAL RESOURCES

- Examples
	- More [examples](examples/functions_examples.md) of functions, return statements, and scope. (Great for review or instructor use)
- Exercises
	- [Google Shopping Functions Lab](exercises/google-shopping-functions) (Advanced)
	- [Functions Quiz](exercises/functions_quiz)
- Videos
  - GA JS Circuit - [Case study: Using Functions](https://generalassembly.wistia.com/medias/iv72hmwzam)
  - GA JS Circuit - [Functions Analogy - Game Plays](https://generalassembly.wistia.com/medias/qmhj5hv27i)
  - GA JS Circuit - [Functions Use Case - Site Sale](https://generalassembly.wistia.com/medias/nz5zkq96je)
- Readings
- Decks
	- [Scope Lesson](lessons/scope_beg.md) with examples and quiz questions (For beg/med groups)
	- [Scope Lesson](lessons/scope_med.md) with many examples (For intermediate groups)
	- [Scope Lesson](lessons/scope.md) (For more advanced groups)
	- [Timing Functions / Callbacks Lesson](lessons/functions_advanced) (For more advanced groups)

> Instructor Note: When possible, provide a brief description of Additional Resources, classifying whether it is for advanced or beginner students.  
