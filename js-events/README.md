# DOM Events

### Learning Objectives

- Describe what HTML DOM events are
- Explain why you would want to listen for events
- List some common DOM events
- Bind an event handler with JavaScript
- Bind an event handler with jQuery
- Add multiple event handlers with event listeners
- Trigger custom events
- Describe the event object
- Prevent the default behavior of certain HTML elements

## Review 

- What is the HTML DOM?
- If we don't need jQuery to write JavaScript, then why use it? 
- How do jQuery selectors work? What do they remind us of? 
- What's the difference between a native DOM element and jQuery DOM element
- What are some common jQuery methods? 
	* `.html()`, `.text()`
	* `.val()`
	* `.css()`
	* `.attr()`
	* `.addClass()`, `.removeClass()`
	* `.hide()`, `.show()`
	* `.append()`, `.prepend()`
- What is meant by method chaining? 

## What

Actions that are generally out of our control like user interactions and web pages being fully loaded result in DOM events to give developers a chance to respond to them. Event handlers are functions that capture these events and take action on them.

## Why

DOM events allow us to create the rich and interactive web experiences that users have come to expect in today's websites.

## Events Fired

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

## Event Listeners

### Check DOM ready



## Event Delegation

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
