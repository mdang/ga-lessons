## Events and Event handling

### Lesson Objectives

* Describe what HTML DOM events are
* Explain why you would want to listen for events 
* List some common DOM events
* Bind an event handler with JavaScript
* Bind an event handler with jQuery
* Add multiple event handlers with event listeners
* Trigger custom events
* Prevent the default behavior of certain HTML elements

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
amazon.com    | automcomplete, pick a department
espn.com      | button click (login)
southwest.com | mouseover 

**We Do** Ask the class for one of their favorite websites, find some events being handled and ask students to identify from the list what event was being captured

#### Event Handlers
So now that we know how important and common events are, how do we capture an event? We do this through event handlers, which are functions we assign to an event. 

**I Do** Create a button and assign an onClick event that will display a simple message to the user.

> Step 1: Add it as an HTML attribute 

```HTML
<a href="#" id=“click-demo" onclick=“alert(‘Good job clicking me!’)”>Click me</a>
```

> Step 2: Add it with a named function

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

> Step 3: Add handler with native JavaScript

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

**I Do** Demonstrate the onLoad event, show what happens when you try to access DOM element at the top of the page without checking if the DOM has loaded yet

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

> Step 2: Show it working with onload event

```HTML
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>
  <script type="text/javascript">
    
    window.onload = function() {
      var elem = document.getElementById('heading');
      elem.innerHTML = 'This is a different heading';
    };
    
  </script>
</head>
<body>
  <h1 id="heading">This is the heading</h1>
</body>
</html>
```

> Step 3: Show page loading with jQuery

```HTML
<!DOCTYPE html>
<html>
<head>
<script src="//code.jquery.com/jquery-2.1.1.min.js"></script>
  <meta charset="utf-8">
  <title></title>
  <script type="text/javascript">

    $(function() {
      $('#heading').text('This is a different heading');
    });

  </script>
</head>
<body>
  <h1 id="heading">This is the heading</h1>
</body>
</html>
```

**Class Question** Do you see any problems with this approach? What happens when you want to add another one?

Students now see how limited assigning a single function as the handler can be. How do we add multiple event handlers? Event listeners allow us to assign more than one function to handle an event. 

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

**I Do / We Do**
You have a new boss who despises the letter x for some reason. Create a text input that will replace the letter x with a "-" every time someone attempts to use it

```
[code]
```

**You Do - 20min**

Step 1: Create a basic form to capture the following fields: 

- First Name
- Last Name

Step 2: Add a submit button

Step 3: Create a ```submit``` event handler that will capture the form contents. This event handler should also prevent the default action, which is to submit the form

Step 4: Get the values of the inputs and display them on the page

### Closing Framing
On the desk, write down 3 DOM events that are particularly interesting to you.

