
## Events and event handling

### Lesson Objectives

* Describe what HTML DOM events are
* Explain why you would want to listen for events 
* List some common DOM events
* Bind an event handler with JavaScript
* Bind an event handler with jQuery
* Add multiple event handlers with event listeners
* Trigger custom events

### Opening Framing
#### What
Actions that are generally out of our control like user interactions and web pages being fully loaded result in DOM events to give developers a chance to respond to them. Event handlers are functions that capture these events and take action on them.

#### Why
DOM events allow us to create rich and interactive web experiences that users have come to expect.

### I do, we do, you do
Notes: 
* Periodically check for understanding as we go along
* Scaffold the exercises to increase in complexity
* Make students do the heavy lifting, ask plenty of questions

When certain actions out of our control are performed, events are fired that give us a chance to respond to them. For the most part these are user actions such as clicking on a button or leaving a webpage, but they can also include events such as the webpage being fully loaded. 

**Class Question** 
Who has ever seen a pop-up box when loading or leaving a web page? What about changing a select box on a form and having the webpage automatically refresh without submitting anything?

**We Do**
What are the kinds of events do we have access to? 
> Google “html dom events”

List examples of most common DOM events that they will be interested in. They don’t need to know all of them, but know that these are the kinds of events accessible.

Examples of websites and event handlers in action

Website       | Examples
------------- | ---------------------------------
amazon.com    | automcomplete, pick a department
espn.com      | button click (login)
southwest.com | mouseover 

> Ask the class for one of their favorite websites, find some and ask students to identify from the list what even might have been captured there 

So now that we know how important and common events are, how do we capture an event? We do this through event handlers, which are functions we assign to an event. 

**I Do** Create a button and assign an onClick event that will display a simple message to the user.

> Step 1: Add it as an HTML attribute 
```
<a href="#" id=“cool-button" onclick=“alert(‘Good job clicking me!’)”>Click me</a>
```

> Step 2: Add it with a named function
```
<a href="#" id=“cool-button" onclick=“buttonClicked()”>Click me</a>
<script> 
  function buttonClicked() { 
    alert(‘Good job clicking on me’); 
  } 
</script>
```

> Step 3: Add handler with native JavaScript
```
<a href="#" id=“cool-button">Click me</a>
<script> 
  document.getElementById('cool-button').onclick = buttonClicked;
  function buttonClicked() { 
    alert('Good job clicking on me'); 
  } 
</script>
```

**Class Question** Do you see any problems with this approach? What happens when you want to add another one?

Students now see how limited assigning a single function as the handler can be. How do we add multiple event handlers? Event listeners allow us to assign more than one function to handle an event. 

**I Do -> We Do**
Modify the previous example to have two event handlers, one to display the quote and the other to change the background color of the webpage.

> Step 1: Introduce event listeners
```

```

> Step 2: Add handler with jQuery
```
<a href="#" id=“cool-button">Click me</a>
<script type="text/javascript">
$(‘#cool-button’).click(function() { 
  alert(‘Good job clicking me with jQuery’); 
} 
</script>
``` 
Triggering custom events and why you would want to. Custom events are not tied to the DOM and can be triggered by you at anytime during script execution. 

**I Do -> We Do**
Create a button that fires an on-click event that loops 1000 times and triggers a custom event that notifies you when it's complete. (it pops up saying that it's tired) 

```

```

Canceling default actions in events (preventDefault, stopPropagation)
**I Do -> We Do**
You have a new boss who despises the letter x for some reason. Create a text input that will replace the letter x with a "-" every time someone attempts to use it

```

```

### Closing Framing
On the desk, write down 3 DOM events that are particularly interesting to you.

### Homework
[INTRO TO HOMEWORK ASSIGNMENT]
