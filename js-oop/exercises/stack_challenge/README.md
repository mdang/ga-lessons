[![General Assembly Logo](https://camo.githubusercontent.com/1a91b05b8f4d44b5bbfb83abac2b0996d8e26c92/687474703a2f2f692e696d6775722e636f6d2f6b6538555354712e706e67)](https://generalassemb.ly/education/web-development-immersive)

# JavaScript Stack Challenge

> In computer science, a stack or LIFO (last in, first out) is an abstract data
> type that serves as a collection of elements, with two principal operations:
> push, which adds an element to the collection, and pop, which removes the last
> element that was added. -- [Stack (abstract data type),
> Wikipedia](https://en.wikipedia.org/wiki/Stack_\(abstract_data_type\))

The goal of this exercise is to practice writing prototype methods. As a
reminder of how we use prototypes, we've provided starter code including a
constructor function and one completed prototype method. Your task will be to
complete the remaining method.

## Instructions

Create a custom JavaScript object modeling a stack using a constructor function
and a prototype.
Starter code has been provided in `stack.js`.

## Requirements

-   You should be able to create a new stack with `var stack = new Stack();`.
-   Your stack should have two methods, `push()` and `pop()`.

    -   `push()` adds a new value to the stack's storage.
    -   `pop()` removes the most recently added value from the stack's storage
        and returns it.

-   You should not use `Array.prototype.push()` or `Array.prototype.pop()`.

### Pre-fill the stack on instantiation

```js
var stack = new Stack(1, 2, 3);
stack.pop(); //=> 3
```

### Allow `push` to chain

```js
var stack = new Stack();
stack.push(1).push(2).push(3);
stack.pop(); //=> 3
```

Which parts of each method are side-effects, and which are the "main" effect?
