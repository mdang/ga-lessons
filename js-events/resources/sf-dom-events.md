<!--
Creator: SF WDI Team
Edited By: Jean, Brianna
Location: SF
-->

![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png)

# DOM Events

### Why is this important?
<!-- framing the "why" in big-picture/real world examples -->
*This workshop is important because:*

Most of the interactivity for JavaScript in the web is based around events.  The browser detects user actions or page status changes and "emits" or sends out an event. Developers then specify behaviors that will happen when a particular event occurs.

### What are the objectives?
<!-- specific/measurable goal for students to achieve -->
*After this workshop, developers will be able to:*

- Explain what DOM events are and how they are triggered.
- Attach event listeners to DOM elements.
- Target the source of an event.
- Respond to events with a callback.
- Explain event propagation.

### Where should we be now?
<!-- call out the skills that are prerequisites -->
*Before this workshop, developers should already be able to:*

- Trace the control flow of a program including functions.
- Distinguish between function definitions and function calls.
- Select DOM elements with jQuery.

### Aside: Callbacks

#####Arguments

A simple function lets us name some behavior (some sequence of code) and reuse it later. 

```js
function sayHelloAli(){
   console.log("Hello, Ali!");
}

sayHelloAli();
```

We can make functions more flexible with arguments:

```js
function sayHello(name){
   console.log("Hello, " + name + "!");
}

sayHello("Ali");
sayHello("Mercedes");
```

Now we have a more flexible and reusable function. 

We can make this even more flexible by passing in a function as an argument. 

```js
function doSomethingToSomeone(targetName, functionToDo){
   console.log("You approach " + targetName + ".");  // higher order functions often add information or behaviors
   functionToDo(targetName);
};
```

Now, we have an even more flexible, reusable function.

```
doSomethingToSomeone("Ali", sayHello);

// You approach Ali.
// Hello, Ali!
```

##### Check for Understanding

1. What will the console output be when you run the following code?

	```js
	function highFive(name){
	  console.log("You send " + name + " a big high five!");
	}

	doSomethingToSomeone("Ali", highFive);
	```

	<details><summary>click to see console output</summary>
	The following is logged to the console:
	> You approach Ali.
	> You send Ali a big high five!
	</details>

1. What will the console output be given the following code?

  ```js
	function attemptSomethingWithSomeone(targetName, functionToTry){
		console.log("You approach " + targetName + ".");
		functionToTry(targetName);
		var success = Math.random();
		if (success < 0.5) {
		  console.log("It goes... okay.");
		} else {
		  console.log("It's awesome!");
		}
	}
	
	function highFive(name){
	  console.log("You send " + name + " a big high five!");
	}
	
	attemptSomethingWithSomeone("Mercedes", highFive);
	```
	
	<details><summary>click for a possible outcome</summary>
	The following might be logged to the console:
	> You approach Mercedes.
	> You send Mercedes a big high five!
	> It goes... okay.
	</details>

![callback](http://i.giphy.com/xT8qBu5gOYEqHhgDQs.gif)

A **callback** is a function that is passed into another function as an argument and then called inside that other function. A function that can take in a callback as an argument is known as a **higher order function**.

```js

function higherOrderFunction (phrase, callback) {
	console.log("I'm the first class function, now calling the callback...");
	callback(phrase);
}

function shoutItCallback(message){
	console.log(message.toUpperCase());
}

function splitItCallback(str){
	console.log(str.split(""));
}

higherOrderFunction("Functions are fun!", shoutItCallback);

higherOrderFunction("Functions are fun!", splitItCallback);

```

##### Callbacks & Iterator Methods

The callback pattern is used a lot in JavaScript. As an example, `.forEach` is a built-in Array **iterator method** that takes in a callback.

```js
var numbers = [123, 45, 0];
numbers.forEach(isEven);

function isEven(num){
	if (num % 2 === 0){
    	console.log(num + " is even!");
    	return true;
	} else {
    	console.log(num + " is odd!");
	}
}
```

> When you use a jQuery selector like `$('p')`, the collection you get back isn't exactly the same as a native JavaScript array. To iterate over a jQuery collection, use jQuery's `.each` **iterator method**. Or, use the `eq` method to access one element by index: `$('p').eq(3)`.

##### Callbacks & Anonymous Functions
Often, the callback function definition is written inside the higher order function call.


```js
var numbers = [123, 45, 0];
numbers.forEach(function isEven(num){
	if (num % 2 === 0){
		console.log(num + " is even!");
		return true;
	} else {
		console.log(num + " is odd!");
	}
});
```

In these cases, the callback often won't be given a name.  A function without a name is called an **anonymous function**.


### Events

**Events are always happening!**

![Click Event](http://i.giphy.com/l0HlL2I8DbNa6JCJa.gif)

In Chrome, we can use the `monitorEvents` utility function to log some events occurring in the window:

```js
monitorEvents(window, ["click", "keypress", "resize", "scroll"]);
```

Here's a larger list of DOM event types:

* `click`
* `mouseenter`, `mouseleave`
* `load`
* `DOMContentLoaded`
* `keydown`, `keypress`, `keyup`
* `scroll`
* `resize`
* `change`

> Note: some events can only be listened to by certain DOM elements. Check documentation.

Events tell us a lot of information. For example, a "click" event includes not just the fact that a "click" occurred but also where, when and what was clicked:

	* `x` and `y` screen coordinates.
	* DOM element that got clicked.
	* Time (timestamp) when it happened.

You can see some of this information if you use [event listener breakpoints](https://developers.google.com/web/tools/chrome-devtools/javascript/add-breakpoints#events) when looking at events in the Chrome JavaScript console.

### Event Listeners

The browser is sending out these events all the time. In order to act on them, we can add event listeners to elements. We'll use JavaScript to tell an element to *listen* for a certain type of event and what to do when that event occurs.


So long as we know the name of the event we're listening for, we can "attach" or "bind" an event listener to our element!

| metaphor                                      | JavaScript example  | jQuery example               |
|----------------------------------------------:|----------------------:| ----------------------:|
| A subject (the thing doing the listening).    | document.getElementById('greeting') | `$('#greeting')`              |
| A trigger (the "event" to listen for).        | .addEventListener('mouseover', ...) |`.on('mouseover', ...)`    |
| An action (how to respond).                   | `function popUpYay(){ ... }` |`function popUpYay(){ ... }`   |


Here's how this looks all together with "vanilla" or "native" JavaScript:

```js
  var greeting = document.getElementById('greeting');
  greeting.addEventListener('mouseover', popUpYay);

  function popUpYay(event){
      alert("Yay!");
  }
```

**Check for Understanding:** Where is this code above using a callback?

When we've selected an element or elements with jQuery, we can use jQuery's `.on` method to add an event listener:

```js
var greeting = $('#greeting');
greeting.on('mouseover', popUpYay);

function popUpYay(event){
    alert('Yay!');
}
```
Sometimes you will see this shorthand:

```js
$('#greeting').mouseover(popUpYay);
```

The `.mouseover(...)` method is equivalent to `.on('mouseover', ...)`. We recommend using `.on` because it has some more flexibility through optional parameters. 

####Check for Understanding

In the last example:

  * What is listening for the event?
  * What trigger are we waiting for?
  * What is the action tied to this event?
  * When is the `popUpYay` function actually executed?

####Check for Understanding

Open your developer console on [jQuery.com](https://jquery.com).

Let's add some behavior for the scroll event for the entire window.  Try selecting the browser's `window` object using `$(window)`.  Note that the argument here is a variable, `window`, not a string `"window"`.  Chrome gives us direct access to the `window` much like we have access to the `document`. 

1. Add an event listener to detect the "scroll" event for the window and `console.log` a message every time the event occurs.

  <details>
    <summary>answer in jQuery</summary>
    ```js
    $(window).on("scroll", logScroll);
		
		function logScroll(){
        console.log("just keep scrolling, scrolling, scrolling");
    }
    ```
  </details>
	
	 <details>
    <summary>vanilla JavaScript version</summary>
    ```js
		window.addEventListener("scroll", logScroll);
		
		function logScroll(){
        console.log("just keep scrolling, scrolling, scrolling");
    }
    ```
  </details>
	

2. Modify your event handler so it adds a new paragraph, `<p>to infinity... and beyond!</p>`, at the bottom of the page every time the user scrolls.

  <details>
    <summary>answer in jQuery</summary>
    ```js
    $(window).on("scroll", addParagraph);
		
		function addParagraph(){
        $("body").append("<p>to infinity... and beyond!</p>");
    }
    ```
  </details>
	
	 <details>
    <summary>vanilla JavaScript version</summary>
    ```js
		window.addEventListener("scroll", addParagraph);
		
		function addParagraph(){
        var newParagraph = document.createElement("p");
				newParagraph.textContent = "to infinity... and beyond!";
				document.body.appendChild(newParagraph);
    }
    ```
  </details>
 
> Note: You can remove event listeners, too.  In vanilla JavaScript, you'd use the `removeEventListener` function. With jQuery, we can use `off`. 




### Checking that the DOM is Ready

User actions can cause the browser to "emit" (send) some kinds of events, but the browser also emits extra events that might be useful for developers. The most important one is `DOMContentLoaded`, which gets sent when the browser is finished creating the Document Object Model. 

Before the `DOMContentLoaded` event occurs, the browser is still working on tasks like deciding which CSS rules apply to particular HTML elements.  Before the `DOMContentLoaded` event occurs, the DOM elements aren't on the page yet.  So if you try to select a DOM element before that event, it won't be there!

**Any code that relies on DOM elements being ready MUST happen after the `DOMContentLoaded` event!**


We can get around this by putting `<script>` tags at very the bottom of the body, because by the time the browser is working on the bottom of the body we can expect the rest of the content is loaded.  However, you'll often see `<script>` tags listed in the head of an HTML file.  In that case, it's important to explicitly listen for the `DOMContentLoaded` event! 

In jQuery, there's a method to check if the DOM is ready. It relies mostly on the `DOMContentLoaded` event, but as a bonus it also accounts for some other specific events used by older browsers.  The jQuery method we use is `ready`, and we apply it to the document in a way that looks like jQuery event handling shorthand:

```js
// code up here does not wait for DOM to be ready


$(document).ready(function(){
    // code in here DOES wait for DOM to be ready
    // best place for DOM element selectors
    // best place to *call* functions that interact with the DOM 
    var greeting = $('#greeting');
	greeting.on('mouseover', popUpYay);
});

// code down here does not wait for DOM to be ready
// great place to define functions, even if they interact with the DOM
function popUpYay(event){
    alert('Yay!');
    // DOM interaction is planned here - but only gets executed when function is called
    $('body').append('Yay!'); 
}
```


#### Check for Understading

Here's part of a site's `index.html`:

```html
<p>Featured click count: <span id="click-count"></span></p>
<ul>
	<li class="featured">1</li>
	<li>2</li>
	<li class="featured">3</li>
</ul>
``` 
  
Assume the JavaScript file below is linked with a `<script>` tag in the head of `index.html`.  What mistake(s) do you see in the code below?

`app.js`

```js
var clickCount = 0;
$('#click-count').text('0');

$(document).ready(function(){
    $('.featured').on('click', updateFeaturedClickCount);
});

function updateFeaturedClickCount(){
	clickCount = clickCount + 1;
	$('#click-count').text(clickCount);
}
```



<details>
<summary>answer</summary>
The only issue is that the text inside the `#click-count` span doesn't initially show 0. The line that tries to make this change, `$('#click-count').text('0');` happens outside `$(document).ready(/* ... */)`, which means it happens before the span is loaded into the DOM. 

Here's a version that works:
  
`app.js`

```js
var clickCount = 0;

$(document).ready(function(){
    $('#click-count').text('0');
    $('.featured').on('click', updateFeaturedClickCount);
});

function updateFeaturedClickCount(){
	clickCount = clickCount + 1;
	$('#click-count').text(clickCount);
}
```

</details>


### Default Behaviors

As a digital native, you take these behaviors for granted:

* When you "submit" a form, you want it to send your data somewhere.
* When you "click" on a link, you expect to navigate to a new page.

Try this on [jQuery's homepage](http://jquery.com/):

```js
var $links = $("a"); // every link on the page
$links.on("click", function handleClick(event){
    alert("You just clicked a link. You are about to be redirected.");
});
```

Redirecting to a new page is the *default behavior* of anchor tags (`a` elements). How would we stop this behavior? What if we need to "prevent (the) default" ?

We have two options: we can `return false` or we can use a special method called `.preventDefault()`.

**`.preventDefault()`** (preferred because it is explicit):

```js
$("a").on("click", function handleClick(event){
    event.preventDefault();
    // more code down here
});
```

**`return false`** (this works too!):

```js
$("a").on("click", function handleClick(event){
    // more code up here
    return false;
});
```


### Event Targets, Bubbling, Delegation

With each event in the DOM there is a `target`. For example, when a user clicks an image, the `target` would be the image that was actually clicked.


#### Event Targets

Consider the following snippets:

`index.html`

```html
<img id="kittenPic" src="http://petnamesplace.com/wp-content/uploads/2009/12/kitten-names-copy.jpg"></img>
```

`app.js`

```js

var kitten = $("#kittenPic");

kitten.on("click", function (event) {
    console.log(this);
    console.log(event.target);
    console.log("target same as this?", this === event.target);
});

```


#### Event Bubbling

This might seem very straightforward, but in reality the `event.target` usually isn't the only element that knows about the event.


`index.html`

```html
<div id="kittenCon">
    <img id="kittenPic" src="http://petnamesplace.com/wp-content/uploads/2009/12/kitten-names-copy.jpg">
</div>
```



`app.js`

```js

var kittenContainer = $("#kittenCon");

kittenContainer.on("click", function (event) {
    console.log(this);
    console.log(event.target);
    console.log("target same as this?", this === event.target);
});

```

Note that that when we click the image we also click anything containing the image - the `#kittenCon` `<div>`, the `<body>`, the whole `document` and `window` objects.

###Event Delegation

Event bubbling enables a tactic called event delegation - attaching an event listener to a parent element when we actually want to listen for events on its children.  

This is most useful when the children aren't there when the page loads. It's impossible to attach an event listener to something that doesn't exist yet!

Let's add a box 3 seconds after the DOM is ready to simulate content that we might have to wait for, like user input or results from an external API.

We'll try to attach an event handler to it directly, as soon as the DOM is ready.

We might try:
`app.js`

```js
$(document).ready(function(){
    // ...
    window.setTimeout(addBox, 3000);
    $(".box").on("click", toggleLongBox);
});

function addBox(){
    console.log("adding a box!");
    newBox = $('<div class="box"></div>');
    $('#box-container').prepend(newBox);
}

function toggleLongBox(event){
    $(this).toggleClass("long-box");
}
```

The box doesn't respond to clicks because we tried to add the event listener too early!

A common strategy is to add the event listener that _will contain_ the elements when they exist. Usually, developers add a special container in the HMTL. We have a div set up with id `"box-container"`.

The `.on` method of jQuery conveniently lets us add an argument to specify which child elements should respond to an event if their parent is listening.

`app.js`

```js
$(document).ready(function(){
    // ...
    window.setTimeout(addBox, 3000);
    // $(".box").on("click", toggleLongBox);  // didn't work!
    $("#box-container").on("click", ".box", toggleLongCon);
});

function toggleLongCon(event){
    $(event.target).toggleClass("long-box");
}
```


### Closing Thoughts

* Event-driven behaviors are the expectation for modern sites.

* Practice selecting DOM elements. This can be done with native JavaScript language features, but we're mainly going to use jQuery library methods.

* Remember, jQuery is a library, not a language.  We use jQuery because it lets us write fewer lines of code - see [youmightnotneedjquery.com](http://youmightnotneedjquery.com/).

* Events bubble; we can use this to our advantage!
