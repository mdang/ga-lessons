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

## Resources

* https://www.codementor.io/vijayst/using-firebase-with-redux-for-building-a-react-app-du1086puw
