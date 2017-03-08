# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) JS Events (90 mins)


| Timing | Type | Topic |
| --- | --- | --- |
| 5 min | [Opening](#opening) | Intro |
| 5 min | [Independent Practice](#independent-practice) | What is an Event? |
| 5 min | [Demo](#setting-up-events) | Setting Up an Event Handler |
| 10 min | [Independent Practice](#color-switcher) | Color Scheme Switcher |
| 10 min | [Intro to New Material](#event-types) | Types of Events |
| 10 min | [Intro to New Material](#this) | This |
| 10 min | [Intro to New Material](#event-object) | Event Objects |
| 10 min | [Guided Practice](#timing-functions) | Timing Functions |
| 30 min | [Independent Practice](#timer-js) | TimerJS |
| 5 min | [Conclusion](#conclusion) |Q&A |

### LEARNING OBJECTIVES
*After this lesson, you will be able to:*

- Explain the concept of a 'callback' and how we can pass functions as arguments to other functions.
- Explain why callbacks are important to asynchronous program flow.
- Write event handlers for common events.
- Define what `this` represents in the context of an event listener.
- Utilize the event object to find out about events that have occurred and prevent the default action on anchors and submit buttons.


### STUDENT PRE-WORK
*Before this lesson, you should already be able to:*

- Access elements in the DOM using Vanilla JS
- Add and remove elements using Vanilla JS
- Edit existing elements in the DOM using Vanilla JS

### INSTRUCTOR PREP
*Before this lesson, instructors will need to:*

- Have students open _entire_ starter_code folder in Sublime/Atom so that all folders/files for independent practice exercises will be easy to access during the lesson.

---
<a name="opening"></a>
## Opening (5 mins)

In order to create interactive and responsive sites, we'll often want to update the DOM based on our user's actions.

For example, when a user _clicks_ on our site's menu icon, a sidebar menu should slide out from the side of the page. Or, if a user _types_ an incorrect format into a form field, that field should become outlined in red.

These actions are called **events**.


![](http://circuits-assets.generalassemb.ly/prod/asset/4723/click_1.gif)

Take a look at this short [video](https://generalassembly.wistia.com/medias/yf3g289u45) providing an overview of the usefulness of events in JavaScript.


#### What is Asynchronicity?

JavaScript is different than most other programming languages because it is designed specifically to work in the event-driven environment of a browser window.

JS is not just executed line by line and then forgotten. When a browser loads HTML and CSS, it then uses its interpreter to run your JavaScript.

Javascript typically will run top-to-bottom. We as developers, however, have no idea when the code related to the button click will actually be executed. _It's totally dependent on the user_.

Therefore, we need to write code that will execute **asynchronously** &mdash; or in other words, outside of the typical top-to-bottom document flow &mdash; and not hold up the rest of our application.

Once your JS has fully loaded, it lives in the background of your browser window, waiting and **listening** for any event triggers you've programmed.

As its name implies, in *event-driven programming*, the flow of a program is driven by events.


This means:

*   The program continually "waits" or listens for events to occur.

*   There are many kinds of events, such as clicking, tabbing into a form field, pressing a computer key down or letting a computer key up, scrolling, resizing the browser window, etc. We'll take a look at some of these events later in this lesson.

*   The event acts as a "trigger," which calls, or runs, a function.

<a name="independent-practice"></a>
## Independent Practice: What is an Event? (5 mins)
But first, a question for you: **What is an event (on a webpage)?** Spend two minutes doing the following tasks. You are encouraged to discuss your findings with a partner during the exercise.

1. Come up with your own definition without looking at any other sources. Don't worry about getting it right &mdash; what do you **think** an event is?
2. Now, find (i.e., Google) some documentation on Javascript events. Does that information match your definition? How would you change it?
3. Write down three examples of an event.  

> If you need some help, you can find information on events and examples [W3Schools](http://www.w3schools.com/js/js_events.asp) and [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/Web/Events).


---
<a name="setting-up-events"></a>
## Setting Up an Event Handler (5 mins)
So, how do we set up, or write, event handlers?

We mentioned previously that we can set up **event handlers** in our scripts that will listen, or wait, for an event to occur and then trigger a function.

#### Syntax
The syntax for setting up an event handler looks like this:

```js
element.addEventListener('nameOfEvent', functionToRun);
```

0. `element` - refers to the DOM node with which we want to tie the event. For example, if we want to trigger an event when the user clicks on a button, the element would be that button element.  
0. `.addEventListener()` - is the method we will use to tie an event listener to an element.
0. `'nameOfEvent'` - is of the event for which we want to listen. For example, maybe we want to wait until the user triggers a 'click' event.
0. `'functionToRun'` - is the name of the function we want to run when the event occurs. When we pass a function as an argument to another function, like we are here, this is what is referred to as a **callback function**.
	- _Note that there are no parentheses after the function name._  
		- `functionToRun` not `functionToRun()`.
		- If we were to include () we invoke the function expression immediately, not after the user interacts with the page.
		- Without the (), we're using the function expression as a reference.


#### Example
> Instructor note: Demo for class. Code for example is in examples > button_click

Let's take a look at an example of an event handler:

```js
var alertUser = function () {
  alert('Button has been clicked!');
}

var button = document.querySelector('button');

button.addEventListener('click', alertUser);
```
Let's break it down:

1. Set up a function that will be triggered when the event occurs (`alertUser`).
2. Find the element we want to tie the event to and save it to a variable (the button).
3. Finally let's set up an event handler using `addEventListener()`.

In the example above, when the user clicks on the button, the alertUser function will run.


---
<a name="color-switcher"></a>
## Independent Practice - Color Scheme Switcher (10 mins)

> Instructor Note: Solution for this part of the exercise can be found [here](solutions/color_scheme_switcher_part_1).

It's time to get practice creating event handlers.

1. Open the [starter\_code > color\_scheme\_switcher](starter_code/color_scheme_switcher) folder in your text editor.
2. Turn and Talk: Take a look at the code that has been provided to you in your `main.js` and `style.css`. What do you think will happen when the functions `turnRed`, `turnWhite`, `turnBlue` and `turnYellow` run?

3. Add event handlers to the `main.js` file such that when a user clicks on one of the colored dots the background color of the entire page changes to match that dot. You should not need to change any HTML or CSS.

> Note: Notice how much repeated/similar code we end up with in our JS file. Later in this lesson we'll look at how we can refactor this code and make it more DRY.


<a name="event-types"></a>
## Types of Events (10 mins)

There are many events that can trigger a function. Here are a few:

|  Event | Description  |
|---|---|
| `'click'`  | When the button (usually a mouse button) is pressed and released on a single element.  |
| `'keydown'`  | When the user first presses a key on the keyboard  |
|  `'keyup'` | When the user releases a key on the keyboard  |
| `'focus'`  | When an element receives focus  |
| `'blur'`  |  When an element loses focus |
|  `'submit'` | When the user submits a form  |
|  `'load'` | When the page has finished loading  |
|  `'resize'` |  When the browser window has been resized |
|  `'scroll'` |  When the user scrolls up or down on a page |
| `'mouseenter`' | When the user's mouse enters an element |
| `'mouseleave'` | When the user's mouse leaves an element |

#### Example

Say we've created a simple form that allows users to subscribe to our email newsletter.

When the user _tabs or clicks away_ from the email input field, we want to make sure the user has entered a value in the field.

> Instructor note: Demo for class. Code for demo is in examples > email_form


Here, we have a simple HTML snippet of an email form.


```html
<form>
	<h1>Email Form</h1>
	<input id="email" type="email" placeholder="Email Address">
	<button type="submit">Subscribe</button>
	<p id="message"></p>
</form>

```

The form contains an input field where the user can enter an email address, a button for submitting the form, and a paragraph with the id _message_ that currently does not have any text inside of it.


Our stylesheet is also very basic.

Take a look at the class `error`, which will give a solid red border to any elements that have the `error` class.

```css
.error {
    border: 2px solid #fa4542;
}
```


Now let's take a look at the event handler in our JS:

```js
// First in our JS, let's find the email input field.
var emailInputField = document.getElementById('email');

// Next up in our JS, let's add our event handler that will trigger the function when the user
// hits tab or clicks out of the email field (the 'blur' event).
emailInputField.addEventListener('blur', checkEmailInput);

// And finally in our JS, let's go ahead and set up that function we want to run when the blur event occurs, checkEmailInput:
function checkEmailInput () {

    // Check to see whether the user has entered a value to the email field.
    if (emailInputField.value.length === 0) {
        // If the email field is blank, display a message to the user.
        document.getElementById('message').innerText = 'Please enter an email address.'

        // Add an error class to the input field that will give it a red border.
        emailInputField.className = 'error';
    } else {
        //Otherwise, clear out the error message.
        document.getElementById('message').innerText = '';

        // Remove the error class from the input field
        emailInputField.className = '';
    }

}
```

Let's take a look at what the page looks like when the user hits tab or clicks away from the email field without entering any information.

![Error](assets/email_form.png)

The email input now has the `error` class, giving the input field a red border.

We've also added a message in the paragraph with the id `message` alerting the user they need to enter an email address.


## Independent Practice - Adding Event Handlers (10 mins)
> Instructor Note: Solution for this part of the exercise can be found [here](solutions/event_listener_practice).

It's time to get practice creating event handlers.

- Open the [starter_code/event\_listener\_practice](starter_code/event_listener_practice) folder in your text editor. We've provided you with three files: `index.html` `style.css` and `main.js`.
- Your job is to add event handlers to create the following functionality...

	* When the user hovers a mouse cursor over the `<div>`, the background of the page should turn blue.
	* When user's mouse cursor is no longer hovering over the `<div>`, the background of the page should turn white.  

- You have been provided with two functions &mdash; `changeBackgroundColorToBlue` and `changeBackgroundColorToWhite` &mdash; that can be used as callbacks. You do not need to change the content of these functions.  


---
<a name="this"></a>
## This (10 mins)

> Instructor note: Demo for students. Example code can be found in [examples/this](examples/this).

As we saw in a previous unit, the keyword `this` refers to the object that "owns" the function that the executed code runs within.

It's important to remember that when we have a method that is inside an object, `this` refers to the object that contains that method.

For example, in the function below, `this` refers to the object that contains the `makeNoise` method, `rover`.

```js
var rover = {
  name: 'Rover',
  species: 'dog',
  breed: 'Golden Retreiver',
  noise: 'bark',
  makeNoise: function () {
    console.log(this.noise);
  }
}
```

However, when a callback function is executed within the context of an event handler, it is the **element (the DOM node)** that owns the context.

So in this case, `this` will refer to the element that we selected when we set up our event handler.


Let's look at an example where we'll change the background color of a circle from blue to red, just by clicking on it:

**HTML:**

```html
<div class="circle"></div>

```

**JS:**

```js
document.querySelector('.circle').addEventListener('click', turnRed)

function turnRed () {
	this.style.backgroundColor = "red";
}

```



Here when we click on the circle and trigger the turnRed function, `this` will refer to the element with the class `circle` within the `turnRed` function.

Here's what that looks like in action:

![](http://circuits-assets.generalassemb.ly/prod/asset/4629/Slide-8.gif)



Alright, but why use the keyword `this`:

`this.style.backgroundColor = "red";`

Instead of just writing:

`document.querySelector('.circle').style.backgroundColor = "red";`

Well, let's imagine that there are several circles on our page:

And we only want the `.circle` that we just clicked to have the updated red background color. That is where the `this` keyword really becomes useful.

Let's take a look:

```js
//Select all elements with the class .circle on the page
var circles = document.querySelectorAll('.circle');

//loop through each .circle element and add an event handler.
for (var i = 0; i < circles.length; i++) {
	circles[i].addEventListener('click', turnRed);
}

function turnRed () {
	this.style.backgroundColor = "red";
}
```

Here we are adding an event handler to each element with the class `.circle`.

When an element with the `.circle` class gets clicked, the `turnRed` function will be called; within that `turnRed` function, `this` will only refer to the `.circle` that triggered the `turnRed` function and not to any of the other circles.

Let's see this in action:

![](http://circuits-assets.generalassemb.ly/prod/asset/4630/Slide-11.gif)

See how we are only adding the style attribute to the circle we are currently clicking on (i.e., the one that triggered the callback function)? Pretty cool, huh?


## Independent Practice: This (10 mins)
> Instructor Note: Solution for this part of the exercise can be found [here](solutions/color_scheme_switcher_part_2).

It's time to get practice creating using the `this` keyword.

Work through this exercise with a partner.

- Open the [starter_code/color\_scheme\_switcher\_part\_2](starter_code/color_scheme_switcher_part_2) folder in your text editor. We've provided you with three files: `index.html` `style.css` and `main.js`.
- Follow the instructions in the `main.js` file.
- You should only need to write code within the `switchTheme` function.

**Challenge Instructions (for advanced students)**

Want to try your hand at this exercise with a little less guidance?

- Open the [starter\_code/color\_scheme\_switcher](starter_code/color_scheme_switcher_part_1) folder in your text editor that you were working from earlier.
- Refactor the code using the following guidlines:
	- Use `querySelectorAll` to select all `li`s on the page.
	- Loop through all list items and add an event listener to each. When a `li` is clicked, call the `switchTheme` function.
	- Create the `switchTheme` function. When the function runs, use the `this` keyword to get the className on the button that was just clicked and update the className on the body to that class.

---
<a name="event-object"></a>
## Event Object (10 mins)
Now that we've gotten the hang of writing event handlers, let's talk a bit about the event object.

When an event occurs, we might want to find out some information about it.

For example, which element did the user interact with that caused the event? What type of event was it? A click event? A mouseover?

Luckily, we can use the **event object** to obtain this kind of information.

Watch this short [video](https://generalassembly.wistia.com/medias/j2rme61inj) for an overview of the event object.

#### Accessing the Event Object
So how do we gain access to the event object?

First, we will need to pass the event object as a parameter.

Take a look at this example:

![](http://circuits-assets.generalassemb.ly/prod/asset/4632/Slide-26-Annotated.svg)

Now if we simply use whichever parameter name we chose (in our case "e") from within the function, we have access to the event object.

Take a look at what the event object looks when you log it to the console, and notice all of the properties we have available to us as part of the event object:

<img src="http://circuits-assets.generalassemb.ly/prod/asset/4633/Slide-27-Codeblock.svg" width="500px">


We'll take a look at a few of these properties, but for now just note how much information about the event the event object holds.

#### `preventDefault()`

> Instructor note: Demo for students. Example is in [examples/event_object](examples/event_object).

Now let's discuss another important use of the event object — `preventDefault()`.

As you may be able to tell from its name, `preventDefault()` allows us to prevent the default behavior of an event.

Some events, like clicking on a link or submitting a form, are meant to take a user to another page.

If no URL is specified, the page will simply load at the top.

But maybe when a user clicks on a link or submits a form, we don't want to take them to another page.

We want to instead fade in some comments.

To do that, we could type:

**HTML:**

```html
<a href="#">View Comments</a>
```

**JS:**

```js
document.querySelector('a').addEventListener('click', viewComments);


function viewComments (e) {
	// Add a class that fades the comments in by changing the opacity to 1
	document.querySelector('#comments').className = 'show-comments';
}
```

Our comments are added at the bottom like we had intended, but we don't want the page to jump to the top!

![](assets/no_prevent_default.gif)

We want to override the default functionality of a link, and have comments appear instead of taking the user to another page.


To prevent this default behavior, we can use the `preventDefault()` method:

```js
document.querySelector('a').addEventListener('click', viewComments);

function viewComments (e) {
	// Prevent page from jumping to top.
	e.preventDefault();

	document.querySelector('#comments').className = 'show-comments';
}
```

Here again, we're passing the event object as a parameter to our callback function.


Notice how within the function, we called the preventDefault method on the event object using dot notation:

`e.preventDefault();`

Let's take a look at the result:

![](assets/prevent_default.gif)



You'll often use this method when you have _anchors_ or _submit buttons_ on a page that you want to provide with some JavaScript functionality, instead of having them take you to another page.


#### `target` (if time permits)

> Instructor note: Demo for students. Example is in [examples/event\_object](examples/event_object)

We can use dot notation to access those properties, just like we did when working with objects

```js
document.querySelector('a').addEventListener('click', viewComments);

function viewComments (e) {
	// To access a property of the event object, we can use dot notation:
	var eventTarget = e.target;
	// Log the target to the console
	console.log(eventTarget);

}
```

Here we are accessing the target of the event by using dot notation `e.target`. We are then logging the target to the console.

Let's take a look at what we see in the console:

`<a href="#">View Comments</a>`

Aha! That's the target of the event, or the element we clicked on that caused the event to fire.

#### `type` (If time permits)

> Instructor note: Demo for students. Example is in [examples/event\_object](examples/event_object)

Or maybe we want to find out what type of event it was. We can find that out by using the type property. Here we are accessing the type of event using `e.type`. Take a look:


```js
document.querySelector('a').addEventListener('click', viewComments);
function viewComments (e) {
	// To access a property of the event object, we can use dot notation:
	var eventType = e.type;
	console.log('The event type is: ' + eventType);

}
```


And here's what we see in the console: `click`.

<a name="timing-functions"></a>
## Independent Practice: Timing Functions (10 mins)

Let's look at timing functions &mdash; that is, Javascript's way of making something happen every `x` seconds.

In your starter code folder, open the [timing\_functions](starter_code/timing_functions) folder.

Take a look at the code that has been provided in the `main.js` file:

```js
function sayHello(){
  console.log("Hi there!")
}
setInterval(sayHello, 1000);
```

### Turn and Talk

Open the `index.html` file in your browser and open the console.


Refresh the page. Spend two minutes observing and answering the following questions...

* What does `setInterval` do?
* What does the number in `setInterval` indicate?
* Replace `setInterval` with `setTimeout`. What's the difference?

We'll make it more interesting by having the timer start on a click event, and stop on another click event.

Take a look at the "start" and a "stop" button that have been provided in your HTML...

```html
<button id="start">Start</button>
<button id="stop">Stop</button>
```

Then, replace the contents of your `script.js` with this...

```js
// Represent the start and stop buttons in Javascript
var start = document.querySelector('#start');
var stop = document.querySelector('#stop');

start.addEventListener('click', startTimer);
stop.addEventListener('click', stopTimer);

// Create a variable that will store our timer
var songTimer;

// Create a callback function that prints something to the console
function singAnnoyingSong(){
  console.log("I know a song that gets on everybody's nerves...");
}

// Create an event listener for the startTimer function that will print something to the console every tenth of a second
function startTimer () {
  songTimer = setInterval(singAnnoyingSong, 100);
}

function stopTimer () {
  clearInterval(songTimer);
}
```

> We define `songTimer` outside of the final two event listeners because we need to be able to access it within both event listeners. In order to do so, we must make it a _global_ variable.

### Turn And Talk

Refresh the page. Observe and spend three minutes answering the following questions...

**What happens when you click the "start" button a bunch of times in a row?**

* Why?
* When you do this, why doesn't the "stop" button seem to work?

**What does `clearInterval` do?**

## Demo: Asynchronicity with Timers

Run the next bit of code and you can see asynchronous program execution.

```js
function anAsyncFunction (){
  console.log("hello");
  setTimeout(function (){
    console.log("this is happening in the middle");
  }, 5000)
  console.log("goodbye");
}

anAsyncFunction();
```

Wait, what? The goodbye came before the "this is happening in the middle"!

With everything else we've seen, Javascript executes one line of code, then when that line is done, executes the next line of code. This is called being **synchronous**.

However, some operations in Javascript are **asynchronous**, meaning Javascript goes on to the next line of code without waiting for the previous line to complete.

#### Why doesn't Javascript wait for these operations to complete before going to the next line of code?

Because otherwise the webpage would just "hang" until the operation completes. The browser can't do anything while Javascript is actively running. We've seen this when we've encountered infinite `while` loops. Asynchronicity is a way of preventing the computer from freezing.

This risk is greatest when Javascript is making requests to other webpages. There's no way of knowing how long the request will take to complete. It could be near-instant, but if the target server is having a bad day, it could take who-knows-how-long. You don't want the operability of your computer to be at the mercy of some random computer somewhere else.

In this small app we made, anything we want to be sure happens **after** those 5 seconds of computing should go inside the callback of the `setTimeout()`. This way, we can be certain that it will run only when the 5 seconds are up.

<a name="timer-js"></a>
## Independent Practice: TimerJS (30 mins) (If time permits)
Get some practice with timing functions!

Take a look at the instructions in [starter\_code/timer\_js](starter_code/timer_js/readme.md).

-------

# Additional Topics

<a name="event-flow"></a>
## Event Flow (15 mins)  (If time permits)
Now that we have a good feel for what the event object is, let's go ahead and look at a concept that is central to event handling in JavaScript: event flow.

We've seen in the past that HTML elements can be nested inside other HTML elements. When we say "nested", we mean that one element can wrap another element.

Take a look at a quick refresher:

```html
<h1>Popular memes for 2016</h1>

<ul>
	<li><a href="">Hotline Bling</a></li>
	<li><a href="">Katy Perry's Left Shark</a></li>
	<li><a href="">Lil Mama Crying</a></li>
	<li><a href="">Pizza Rat</a></li>
	<li><a href="">What's Good?</a></li>
</ul>
```

Here we have a `ul` that is wrapping five `li`. Each `li`, in turn, is wrapping an anchor.

In other words, we could say that each `a` is nested inside of an `li`, and each `li` is nested inside the `ul`.

When we hover over an anchor and click on it, JS can trigger any events that are tied to the anchor, as well as any events that are tied to any elements the `a` is nested within (i.e., the `li` it sits within, the `ul` it is also nested within).

If we zoom out a bit and remember the DOM tree, we will remember that our `ul` is nested inside the `body`, which is nested inside the `html`, which is nested inside the document object.

Events that are bound to any of these elements will trigger when we click on the `a`.

![](http://circuits-assets.generalassemb.ly/prod/asset/5152/Screen_Shot_2016-08-08_at_10.02.00_AM.png)

The order in which these events fire is called **event flow**.

#### Event Bubbling
**Event bubbling** is when the event starts at the most specific element node and then flows outwards towards the least specific node.


<img src="http://circuits-assets.generalassemb.ly/prod/asset/4637/Slide-42-Event-Bubbling.svg" width="300px">

Here the event will start at the `a`, the most specific node, and then work its way outward, triggering any events that might be tied to the `li`, then the `ul`, then the `body`, then finally, the `document` (in this case, the HTML doc).

#### Why does this matter?

> Instructor note: Demo for students. Example code can be found in [examples/event\_flow](examples/event_flow).

Understanding event flow comes into play when the code has event handlers that are tied to the element that triggers the event and any of its ancestors or descendants.

Take a look at our example from before. We've gone ahead and tied an event handler to the `a`, `li`, `ul`, `body` and `document` elements that appends a paragraph element to the body that states "[element name] has been clicked"

![](http://circuits-assets.generalassemb.ly/prod/asset/4638/Slide-45.gif)

The order in which those messages are appended to the body: "Anchor has been clicked" is appended first, and "Document has been clicked" is appended last, since the events are flowing outwards from the most specific element.

The key concept here is that _events are triggered not only for the element that we tie the event handler to, but also for any elements that element is nested inside of_.

The flow in which these events happens is from the _most specific_ element to the _least specific_ element (outwards in the diagram).

#### Event Propagation
Now let's talk about `stopPropagation()`.

There may be instances where we don't want an event to bubble up to its ancestors.

If we want to stop this behavior, we can use the event object's `stopPropagation()` method to prevent this bubbling.

Let's take a look:


```js
function addAnchorMessage (e) {
  e.stopPropagation();
  document.querySelector('body').appendChild = 'Anchor has been clicked';
}
```

Here again we pass in the event object as a parameter, "e".

We then access the `stopPropagation()` method using dot notation. This prevents the event from bubbling up to any ancestors.

Now when we click on an anchor, we don't see messages being appended for each ancestor element since those events are no longer being triggered:

![](http://circuits-assets.generalassemb.ly/prod/asset/4639/Slide-50.gif)

This is just one more helpful use of the event object!

Now you understand a bit more about event flow and how multiple event handlers may be triggered on any ancestor elements.

We took a look at how the flow of events happens—from the most specific, or target, element outwards to the least specific ancestor element.

Having a grasp on this flow will be immensely helpful in the future when you're working on complex interactions and trying to understand the order in which events will happen.


---
<a name="key-events"></a>
## Key Events (10 mins) (If time permits)

Let's explore some other events.

Open [starter\_code/key\_events](starter_code/key_events) in your text editor.

#### Independent practice

With a partner, take a look at the code that has been provided in `main.js`. Explore the `event` object again. **Can you find a way to tell which key was pressed?**

#### Guided Practice - Key Events

> A cross-browser way of telling which key is pressed is using the `keyCode` property. For `d`, `evt.keyCode` is `68`. For Shift, it's `16`.



#### Independent Practice

Find the keyCodes for...
* Enter
* Tab
* Delete

#### Independent Practice

There are several other events that come up with the `input` tag. See if you can figure out the difference between...

* `keyup`
* `keydown`
* `keypress`
* `change`
* `focus`
* `blur`

> If you want to test out more Javascript events, an extensive list can be found [here](https://developer.mozilla.org/en-US/docs/Web/Events).

---
<a name="multiple-events"></a>
## Multiple Events (10 mins)  (If time permits)
There may be instances where we want to trigger multiple functions when an event occurs.

For example, maybe when our user clicks the "submit" button we want to run a function that will check to see if the form is valid and call another function that will display a "loading" icon.

In a case like this, we'd have multiple event handlers for one event.

To trigger multiple functions, first define the functions that you want to be called when our event occurs.

For example, on the next slide, we define two functions: `showLoadingIcon()` and `checkEmailInput()`.

```js
function showLoadingIcon() {
  document.getElementById('loading').style.display = "block";
}
function checkEmailInput() {
  var emailInputField = document.querySelector('input');
    // Check to see whether the user has entered a value to the email field.
    if (emailInputField.value.length === 0) {
      // If the email field is blank, display a message to the user.
      document.getElementById('message').innerText = 'Please enter an email address.'
      // Add an error class to the input field that will give it a red border.
      emailInputField.className = 'error';
    } else {
      // Otherwise, clear out the error message.
      document.getElementById('message').innerText = '';
      // Remove the error class from the input field
      emailInputField.className = '';
    }
}
```

Alternatively, you could write something like this, which should still get the point across:


```js
function showLoadingIcon() {
  // Code to show the loading icon
}

function checkEmailInput() {
  // Code that checks to see if the user entered an email address
  // And adds a red border to the input and an error message if not.
}
```


We'll then need to define a third function, which will contain the previous two functions:

```js
function submitForm() {
  showLoadingIcon();
  checkEmailInput();
}
```




Finally, we'll assign that third function as the event handler:


```js
document.getElementById('submit').addEventListener('click', submitForm);
```

Lets recap the steps before we move on:

1.  Start with input and button elements (in our HTML).

3.  Attach an event listener to the button.

5.  Invoke two functions within the event handler.

*   The first function showed the loading icon.
*   The second function validated the email address.



***

<a name="conclusion"></a>
## Conclusion (5 mins)
As we wrap things up, watch this short [video](https://generalassembly.wistia.com/medias/p89saznrue) where a developer talks about the role events played in a recent project she worked on.

In this lesson, we learned how we can react to our users' actions when they visit our site.

We saw how we can harness JavaScript's event handling to wait until the user takes an action — like clicking on a button or scrolling down the page — and then run a block of code, or a function, when this event occurs.

We also saw how we can use the keyword this to access the individual element that caused an event to fire.

We learned that we can gain access to the event object by passing it in as a parameter to a callback function. This gives us access to the properties and methods tied to the event object from within that callback function.

Up until this point we've been writing things out in "plain vanilla" JavaScript.

In the next lesson we'll take a look at how we can harness the power of jQuery to write JavaScript that will work in different browsers, in a much friendlier syntax.

***

### ADDITIONAL RESOURCES
- Exercises
	- WDI Remote - [Trivia Game](exercises/trivia_game) (90 mins - Intermediate)
- Videos
	- JS Circuits - [Event Driven Programming](https://generalassembly.wistia.com/medias/mr8fqbknuq)
	- JS Circuits - [Callback Functions](https://generalassembly.wistia.com/medias/9lo8qk7l5c)
	- JS Circuits - [Event Object](https://generalassembly.wistia.com/medias/j2rme61inj)
	- JS Circuits - [Case Study: Event Listeners](https://generalassembly.wistia.com/medias/p89saznrue)
	- JS Circuits - [Responsive States](https://generalassembly.wistia.com/medias/yf3g289u45)
  - [Robin's Screencast](https://youtu.be/S4Xvo_m6P04)
  - [Andy's Screencast (Part I)](https://www.youtube.com/watch?v=xogI6prB-PI)
  - [Andy's Screencast (Part II)](https://www.youtube.com/watch?v=Srd2Tx1Z7v8)
- Readings
	- Eloquent JavaScript [Events](http://eloquentjavascript.net/14_event.html)


