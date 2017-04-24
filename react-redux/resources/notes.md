# Redux Notes

Redux organizes data in the front-end using three principles.

1. The state of the application is stored in a single object tree.
2. The state is read-only.
3. The state can be changed by emitting an action which describes the desired change.


Whenever a component wants to change the data stored within the store: 

1. It prepares an action object and dispatches the action object to the store. 
2. The store passes on the action to several reducers. 
3. A reducer is a JavaScript function which takes the previous state of the store and the action object and then creates a new state for the store.

## Resources

* https://www.codementor.io/vijayst/using-firebase-with-redux-for-building-a-react-app-du1086puw
