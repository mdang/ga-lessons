# Redux Notes

## What is Redux?

Redux organizes data in the front-end using three principles.

1. The state of the application is stored in a single object tree.
2. The state is read-only.
3. The state can be changed by emitting an action which describes the desired change.

Whenever a component wants to change the data stored within the store: 

1. It prepares an action object. Actions are objects which have an action `type`. The action object is dispatched to the store.
2. The store passes on the action to several reducers. 
3. A reducer is a JavaScript function which takes the previous state of the store and the action object and then creates a new state for the store.

## When should we use Redux? 

Pete Hunt, one of the early contributors to React, says:

> You'll know when you need Flux. If you aren't sure if you need it, you don't need it.

Similarly, Dan Abramov, one of the creators of Redux, says:

> I would like to amend this: don't use Redux until you have problems with vanilla React.

In general, use Redux when you have reasonable amounts of data changing over time, you need a single source of truth, and you find that approaches like keeping everything in a top-level React component's state are no longer sufficient.

However, it's also important to understand that using Redux comes with tradeoffs. It's not designed to be the shortest or fastest way to write code. It's intended to help answer the question "When did a certain slice of state change, and where did the data come from?", with predictable behavior.

## Structure 

![Redux structure](https://camo.githubusercontent.com/13227c2a980b327c8efda916f1c47271238a017a/687474703a2f2f692e696d6775722e636f6d2f4455694c39796e2e706e67)

## redux-thunk

To enable asynchronous communication within the Redux layer, Redux has a middleware component called `redux-thunk`.

Redux Thunk allows a react component to dispatch a function instead of an action object. The dispatched function usually interacts with the API and dispatches an action object when it receives a response from the API.

#### Why not just embed Firebase directly into components? 

It is possible to use Firebase directly within React components but this will make the React components hard-to-maintain. Moving the Firebase code to the Redux layer greatly simplifies the code structure as Redux passes data to the React components via props. This, in turn, allows writing functional or stateless components that just renders the props.

## react-redux

`react-redux` has Providers and Connectors to connect a React component to a Redux store. The Provider component is responsible for providing the store to downstream components. The connect function wraps a React component and provides the state of the store via props.

In a nutshell, we use `redux-thunk` to dispatch functions which interact with Firebase. We use `react-redux` to connect React components to the Redux store.

## Dependencies

```
redux
react-redux
redux-thunk
redux-logger
firebase
```

* `redux` and `react-redux` packages are used to connect React components with the Redux store.
* `redux-thunk` and `redux-logger` are redux middleware packages

## Resources

* http://redux.js.org/
* https://www.codementor.io/vijayst/using-firebase-with-redux-for-building-a-react-app-du1086puw
* https://github.com/buckyroberts/React-Redux-Boilerplate
