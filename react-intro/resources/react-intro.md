# Intro to React.js

### Objectives

- Understand what problem React.js solves
- Use JSX to create a React component
- Render basic React components using the ReactDOM
- Understand the concepts of React components, props, and state
- Understand the concepts of the virtual DOM
- List the different types of components (controlled [React managed state] vs uncontrolled), and why you would want to use one over another
- Create your own React components

## Introduction to React

### Some History

The first thing most people hear about React is "Facebook uses it."

- First used by Facebook in 2011. 
- Then Instagram in 2012.
- Went open source in May 2013.

React was born out of Facebook's frustration with the traditional MVC model and how...

- Re-rendering something meant re-rendering everything (or just a lot).
- That had negative implications on processing power and ultimately user experience, which at times became glitchy and laggy.

> If you want to get a taste of what React's all about, here's an introduction from React.js Conf 2015 (watch first 10 minutes): https://www.youtube.com/watch?v=x7cQ3mrcKaY

#### React in MVC

AngularJS is an example of a MVC framework, where everything displayed is dependent on data manipulated in a controller. A few years ago at Facebook, the development team created a framework designed only for the View. This resulted in ReactJS, a front end JavaScript framework used for creating user interfaces.

The goal of React was to create components based on views; views as in the *view* of model-view-control. Imagine breaking a webpage up into multiple elements - you already do that, right? React was designed to solve the problem of breaking front-end design elements into self-contained components. 

> A component in React is essentially designed to output HTML

**Selling Point:** By modeling small compatible components that focus on just rendering a view, we as developers can move business logic out of the DOM, and therefore improve our app's performance, maintainability, modularity, and readability.

**React can be thought of as the "Views" layer.**

What is the role of a "view" in a front-end Javascript application?

React can be used agnostically throughout your stack. It's role is just to use data to render a UI.

- This means that React can also coexist with other Javascript frameworks. Let them handle the models and controllers, and have React sort out the views.

React deals specifically with rendering data as HTML, so it involves a different mode of thinking when compared to Angular. In React, data flows in one direction (no two-way data binding), and data is modularized using components.

## Terminology We'll Need

#### One-Way Data Flow

Data is not bound in both directions in React. Meaning, if we want an input field to update the actual data in a component, we'll need to call a function to modify the value. Compare this to Angular, where we can change the value of an input field bound to `ng-model` and it'll automatically update the value in the controller.

#### Virtual DOM

React uses what's called a virtual DOM. When React renders data to the page, the differences are computed by comparing the page to the virtual DOM. When a component needs to be re-rendered, only the component and its subcomponents are actually rendered. This ideally results in a more efficient rendering process. It does the least amount of DOM manipulation possible in order to keep your components up to date.

Example: Imagine you had an object that you modeled around a person. It had every relevant property a person could possibly have, and mirrored the persons current state. This is basically what React does with the DOM.

Now think about if you took that object and made some changes. Added a mustache, some sweet biceps and blue eyes. In React-land, when we apply these changes, two things take place. First, React runs a “diffing” algorithm, which identifies what has changed. The second step is reconciliation, where it updates the DOM with the results of diff.

The way React works, rather than taking the real person and rebuilding them from the ground up, it would only change the face and the arms. This means that if you had text in an input and a render took place, as long as the input’s parent node wasn’t scheduled for reconciliation, the text would stay undisturbed.

The Virtual DOM is a Javascript representation of the actual DOM.

- Because of that, React can keep track of changes in the actual DOM by comparing different instances of the Virtual DOM.
- React then isolates the changes between old and new instances of the Virtual DOM and then only updates the actual DOM with the necessary changes.
- By only making the "necessary changes," as opposed to re-rendering an entire view altogether, we save up on processing power.
- This is not unlike Git, with which you compare the difference -- or `diff` -- between two commits.
 
![Virtual DOM Diagram](https://docs.google.com/drawings/d/11ugBTwDkqn6p2n5Fkps1p3Elp8ZToIRzXzvM4LJMYaU/pub?w=543&h=229)


#### JSX

We keep mentioning data, and how each component is actually just storing data. But how is that data rendered? We'll be using a syntax called JSX to render our components. It is very XML-like in structure. It is designed to abstract away complex HTML design templates into a nice, easy to use tag/attribute style syntax. JSX is a preprocessor step that adds XML syntax to JavaScript. You can definitely use React without JSX but JSX makes React a lot more elegant.

Just like XML, JSX tags have a tag name, attributes, and children. If an attribute value is enclosed in quotes, the value is a string. Otherwise, wrap the value in braces and the value is the enclosed JavaScript expression.

Great sublime package to help with color coding called BABEL. After installation, change the settings: view > syntax > open all as > babel > js

#### Front-End Build Tools
In order to get the most out of the features of ES6, JSX and bundling, we need them. These are different a build tools. JSX is not understood by the browser so we need something to compile and bundle our npm packages and our JS into a single file. In production setups, we'll need to find another way to transpile ES6/JSX -> ES5, as well as another way to require the modules we need.

* Browserify: allows us to use require in front-end files
* Webpack: module bundler which takes modules with dependencies and generates static assets by bundling them together based on some configuration.
* Babel: a tool which translates them to the format that has been supported by the browsers.


## Basic React Example

### Components + ReactDOM

Let's take a look at what a React.js component looks like. In React, components mount to an element, so in this example we can use the div `container` as it’s parent container. Then we use the **ReactDOM** to `render` elements on our page.

```javascript
<script type="text/babel">
      ReactDOM.render(
        <h1>Hello, world!</h1>,
        document.getElementById('container')
      );
</script>
```

In order to translate it to vanilla JavaScript we use `<script type="text/babel">` and include Babel to actually perform the transformation in the browser. Open the html from a browser and you should already be able to see the greeting!

Your React JSX code can live in a separate file but it needs to be served via HTTP or the file fails to load. So we will keep it inline for now.

When using the render method above, our first argument is the component we want to render, and the second is the DOM node it should mount to. We can use the createClass method to create custom component classes. It takes an object of specifications as it’s argument. Lets create one below:

```js
var MyComponent = React.createClass({
    render: function(){
        return (
            <h1 className="heading">Hello, world!</h1>
        );
    }
});
```

After declaring a React class we can render it to our document like so:

```js
ReactDOM.render(
    <MyComponent/>,
    document.getElementById('container')
);
```

This will render out to be:

```html
<div id='container'>
  <h1>Hello world</h1>
</div>
```

##### About our First Component

Here are some notes about our first component:

- We used React to create the component by calling `createClass`
- We used `ReactDOM` to attach the component to the DOM, by defining the component as JSX and the element we wanted to attach the component to.
- JSX syntax != HTML syntax. Note that in order to get the `heading` class to appear, we needed to use the attribute `className`. Here are [some more details on JSX syntax](https://facebook.github.io/react/docs/jsx-in-depth.html)
- Native HTML element names start with a lowercase letter, while custom React class names begin with an uppercase letter
- The `render` function is what renders the component to the screen.

### Props

Data passed in from a parent component is available as a 'property' on the child component. These 'properties' are accessed through `this.props` and are immutable (cannot be changed while your program is running). They can be used in our render method to render dynamic data. 

```Javascript
var MyComponent = React.createClass({
    render: function(){
        return (
            <h1>Hello, {this.props.name}!</h1>
        );
    }
});

ReactDOM.render(<MyComponent name="Britney Jo" />, document.getElementById('container'));
```

> NOTE: The return statement in `render` can only return one DOM element. You can, however, place multiple elements within a parent DOM element, like we do in the previous example with `<div>`.

##### ReactDOM Overview 

Let's take a look at an overview of how to render with the **ReactDOM**:

```Javascript
ReactComponent render(
  ReactElement element,
  DOMElement container,
  [function callback]
)
```

* The *ReactElement* argument is our component (which we defined above). This is the variable name we gave our component when we declared one using `React.createClass({});`
* The *DOMElement* container is a Javascript selector for the HTML container to place our component inside. Example: `document.getElementById('id-to-place-this')`
* The *Callback* is a function that can be hooked in to call once the render function has been completed.
* Do not ever, ever render to the `body` tag. It is not best practice.

```javascript
var Item = React.createClass({
    render: function () {
        return <article>
        <h1>{this.props.title}</h1>
        <p>{this.props.description}</p>
        </article>;
    }
});

ReactDOM.render(
    <Item title='Star Wars Ticket' description='A long time ago, in a galaxy far, far away...' />,
    document.getElementById('container')
);
```

### State

Every component has a state object and a props object. To implement interactions, we introduce mutable state to the component. `this.state` is private to the component and can be changed by calling `this.setState()`. When the state updates, the component re-renders itself. Calling setState triggers UI updates and is the bread and butter of React’s interactivity. If we want to set an initial state before any interaction occurs we can use the `getInitialState` method. Below, see how we can set our component’s state:

```js
var Counter = React.createClass({
    getInitialState: function(){
        return {
            count: 5
        }
    },
    render: function(){
        return (
            <h1>Count of {this.state.count}</h1>
        )
    }
});

ReactDOM.render(<Counter/>, document.getElementById('container'));
```

Ok, we set an initial state. But how do we go about changing it?

We need to set up some sort of trigger event to change our counter. Let's do that via a button click event -- where should we initialize it?
 
### Events

React also has a built in cross browser events system. The events are attached as properties of components and can trigger methods. Lets make our count increment below using events:

```js
var Counter = React.createClass({
  getInitialState: function(){
     return {
       count: 5
     }
  },
  increaseCount: function(){
    this.setState({
      count: this.state.count + 5
    });
  },
  
  render: function(){
    return (
      <div>
        <h1>Count of {this.state.count}</h1>
        <button onClick={this.increaseCount}>Increase</button>
      </div>
    );
  }
});

ReactDOM.render(<Counter/>, document.getElementById('container'));
```
#### YOU DO: How can we change the count to start as a property but be able to increase by 1 on every button click?

```js
var Counter = React.createClass({
  getInitialState: function(){
     return {
       count: this.props.counter
     }
  },
  increaseCount: function(){
    this.setState({
      count: parseInt(this.state.count) + 1
    });
  },
  
  render: function(){
    return (
      <div>
        <h1>Count of {this.state.count}</h1>
        <button onClick={this.increaseCount}>Increase</button>
      </div>
    );
  }
});

ReactDOM.render(<Counter counter="1"/>, document.getElementById('container'));
```

Whenever we run `.setState`, our component "diff's" the current DOM, and compares the Virtual DOM node with the updated state to the current DOM.

- Only replaces the current DOM with parts that have changed.
- This is super important! Using React, we only change parts of the DOM that need to be changed. This has **strong** implications on performance.
