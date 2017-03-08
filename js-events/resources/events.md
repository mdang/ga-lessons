## Events and Event Handling

### Lesson Objectives

* Describe what HTML DOM events are
* Explain why you would want to listen for events 
* List some common DOM events
* Bind an event handler with JavaScript
* Bind an event handler with jQuery
* Add multiple event handlers with event listeners
* Trigger custom events
* Describe the event object
* Prevent the default behavior of certain HTML elements

## Review 

- What is the HTML DOM?
- If we don't need jQuery to write JavaScript, then why use it? 
- How do jQuery selectors work? What do they remind us of? 
- What's the difference between a native DOM element and jQuery DOM element
- What are some common jQuery methods? 
	* .html(), .text()
	* .val()
	* .css()
	* .attr()
	* .addClass(), .removeClass()
	* .hide(), .show()
	* .append(), .prepend()
- What is meant by method chaining? 

### Opening Framing

#### What
Actions that are generally out of our control like user interactions and web pages being fully loaded result in DOM events to give developers a chance to respond to them. Event handlers are functions that capture these events and take action on them.

#### Why
DOM events allow us to create the rich and interactive web experiences that users have come to expect in today's websites.

### I do, we do, you do
Notes: 
* Periodically check for understanding as we go along
* Scaffold the exercises to increase in complexity
* Make students do the heavy lifting, ask plenty of questions

When certain actions out of our control are performed, events are fired that give us a chance to respond to them. For the most part these are user actions such as clicking on a button or leaving a webpage, but they can also include events such as the webpage being fully loaded. 

**Class Question** 
Who has ever seen a pop-up box when loading or leaving a web page? What about changing a select box on a form and having the webpage automatically refresh without submitting anything?

#### HTML DOM Events
**We Do**
What are the kinds of events we have access to? 
> Google “html dom events”

List examples of most common DOM events that they will be interested in. They don’t need to know all of them, but know that these are the kinds of events available to be captured.

#### Examples
Examples of websites and event handlers in action

Website       | Examples
------------- | ---------------------------------
amazon.com    | auto-complete, pick a department
espn.com      | button click (login)
[Bootstrap](https://blackrockdigital.github.io/startbootstrap-freelancer) | scrolling through theme 

**We Do** Ask the class for one of their favorite websites, find some events being handled and ask students to identify from the list what event was being captured

#### Event Handlers
So now that we know how important and common events are, how do we capture an event? We do this through event handlers, which are callback functions we assign to an event. 

**onLoad Event** 

Demonstrate the onLoad event, show what happens when you try to access DOM element at the top of the page without checking if the DOM has loaded yet

> Step 1: Doesn't work, because the DOM element hasn't loaded yet

```HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <script type="text/javascript">
    
    var elem = document.getElementById('heading');
    elem.innerHTML = 'This is a different heading';
    
  </script>
</head>
<body>
  <h1 id="heading">This is the heading</h1>
</body>
</html>
```
<strike>
> Step 2: Show it working with onload event

```HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <script type="text/javascript">
    
    // Window is loaded entirely, including images/CSS
    window.onload = function() {
      var elem = document.getElementById('heading');
      elem.innerHTML = 'This is a different heading';
    };
    
    // document.onload -> varied support
    // body.onload -> varied support
    
  </script>
</head>
<body>
  <h1 id="heading">This is the heading</h1>
</body>
</html>
```
</strike>

> Step 3: Show page loading with jQuery

```HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
  <script type="text/javascript">

    // jQuery worries about how to detect the DOM ready event across browsers
    $(function() {
      $('#heading').text('This is a different heading');
    });
    
    $(document).ready(function() {
      // This is the long way of checking 	
    });

  </script>
</head>
<body>
  <h1 id="heading">This is the heading</h1>
</body>
</html>
```

<strike>

**I Do** Create a button and assign an onClick event that will display a simple message to the user.

**Add it as an HTML attribute**

```HTML
<a href="#" id=“click-demo" onclick=“alert(‘Good job clicking me!’)”>Click me</a>
```

**Add it with a named function**

```HTML
<a href="#" id=“click-demo" onclick=“buttonClicked()”>Click me</a>
```

```JAVASCRIPT
<script> 
  function buttonClicked() { 
    alert(‘Good job clicking on me’); 
  } 
</script>
```
</strike>

<strike>
**Add handler with native JavaScript**

```HTML
<a href="#" id=“click-demo">Click me</a>
```
```JAVASCRIPT
<script> 
  document.getElementById('click-demo').onclick = buttonClicked;
  function buttonClicked() { 
    alert('Good job clicking on me'); 
  } 
</script>
```

**Class Question** Do you see any problems with this approach? What happens when you want to add another one?

Students now see how limited assigning a single function as the handler can be. How do we add multiple event handlers? Event listeners allow us to assign more than one function to handle an event. 

</strike>

**I Do / We Do**
Modify the previous example to have two event handlers, one to display the quote and the other to change the background color of the webpage.

> Step 1: Introduce event listeners

```HTML
<a href="#" id=“click-demo">Click me</a>
```
```JAVASCRIPT
<script> 
  var link = document.getElementById('click-demo');
  link.addEventListener('click', function() {
    alert('Good job one');
  });
  link.addEventListener('click', function() {
    alert('Good job two');
  });
</script>
```

> Step 2: Add handler with jQuery

jQuery has several ways to add event listeners. We will look at a couple of them in this lesson.

Here is a straight forward way to add an event listener to a button:

```js
$('#myButton').click(function(evt){
	console.log(evt);
	//console.log(this);
});
```
Refresh the page and open the console to see what the `evt` argument (jQuery's _event_ object) passed in by jQuery looks like and what `this` is set to.

jQuery's _event_ object can come in handy, especially when listening to mouse events. It is this object for example that would make writing a drawing or paint application possible.

Here is an alternative syntax. This syntax is preferred because the syntax above actually calls this next version internally.

```js
$('#myButton').on('click', function() {
	//console.log(this);
});
```
In all cases, note that if you don't need to use the _event_ argument, you don't have to include it.

[These docs](http://api.jquery.com/category/events/) have a complete list of event methods.

#### Event Delegation

_Event delegation_ allows us to attach a single event listener to an element that will fire for all descendants matching a selector, whether those descendants exist now or are added in the future.

This is possible courtesy of something known as _event bubbling_, implemented in all major browsers. With event bubbling, un-handled events "bubble up" the DOM until a listener for that type of event is found. If there is no listener, so be it.

```HTML
<a href="#" id=“click-demo">Click me</a>
```

```JAVASCRIPT
<script type="text/javascript">
$('#click-demo').on('click', function() {
  console.log('Click handler 1 fired');
});  
$('#click-demo').on('click', function() {
  console.log('Click handler 2 fired');
});
</script>
``` 

**You Do - 20min**

https://gist.github.com/mdang/e0430a2f779e095af192

<strike>
#### Custom Events
Triggering custom events and why you would want to. Custom events are not tied to the DOM and can be triggered by you at anytime during script execution. 

**I Do / We Do**
Create a button that fires an on-click event that loops 1000 times and triggers a custom event that notifies you when it's complete. (it pops up saying that it's tired) 

```HTML
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
  <meta charset="utf-8">
  <title></title>
  <script type="text/javascript">
    
    $(function() {
      $('#runner').on('click', function() {
        for (var i=0; i < 1000; i++) {
          // Some really long operation that takes a while to complete
        }
        
        $('#runner').trigger('finished');
      });
      
      $('#runner').on('finished', function() {
        console.log("I'm so tired!!!!");
      });
      
    });

  </script>
</head>
<body>
  <input id="runner" type="button" value="Start running">
</body>
</html>
```
</strike>

#### Event Objects

Browsers which follow W3C standards always pass the event object as the first argument for the handler.

Canceling default actions in events (preventDefault, stopPropagation)

**I Do**
Demonstrate preventing the default action from taking place

- Using ```e.preventDefault()``` does not keep events from bubbling up
- Using ```e.stopImmediatePropagation()``` DOES keep events from bubbling up
- Using ```return false``` with regular JavaScript will NOT keep events from bubbling up
- Using ```return false``` with jQuery DOES keep events from bubbling up

```HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
</head>
<body>
	<div id="demo-container">
  	<a href="http://google.com" id="click-demo">Lead me to the Google</a>
  </div>

  <script type="text/javascript">
  
    $('#click-demo').on('click', function(event) {
        alert('Not today!');
        console.log(event);
        
        // event.preventDefault();
        // event.stopImmediatePropagation();
        // return false;
      });

    $('#demo-container').on('click', function() {
  		alert('I registered a click also!');
  	});
    
  </script>
</body>
</html>
```

**You Do (Pair Programming) - 20min**

https://gist.github.com/mdang/16071a7acb1ac354c38a

Reference: http://stackoverflow.com/a/3883621

**Solution**

```HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <style type="text/css">
  	#filtered {
  		width: 90%;
  		font-size: 175%;
  		margin: 15% 5%;
  		padding: 5px;
  	}
  </style>
</head>
<body>
  <form name="no_x_form" id="no_x_form">
  	<input type="text" name="filtered" id="filtered">
  </form>
  
  <script type="text/javascript">
    $('#filtered').on('keypress', function(event) {
      console.log(event.keyCode);
      var keyCode = parseInt(event.keyCode, 10);
      
      // NOTE: This is a tricky exercise because different browsers sometimes report different keyCodes. 
      // 120 is keyCode for "x", 88 is keyCode = "X"
      if (keyCode === 120 || keyCode === 88) {
        event.preventDefault();
      }
      
    });
  </script>
</body>
</html>
```
