# <img src="https://cloud.githubusercontent.com/assets/7833470/10899314/63829980-8188-11e5-8cdd-4ded5bcb6e36.png" height="60">

## Todo API: Step by Step - Create & Read Routes

### `todos#index`

1. <details>
    <summary>Create a server route to handle the `GET` request (for all `todos`).</summary>
    ```js
    app.get('/api/todos', function index(req, res) {
        // What are you going to send back to the client?
    });
    ```
</details>

2. <details>
    <summary>Respond with the collection of `todos` (remember, we don't have a persistent database yet, so we're using an array called `todos` to represent our "database"). It's best practice to respond with an object rather than an array, so create an object with the key `todos`, and the value should be the collection of `todos`.</summary>
    ```js
    var todos = [
        { _id: 1, task: 'Laundry', description: 'Wash clothes' },
        { _id: 2, task: 'Grocery Shopping', description: 'Buy dinner for this week' },
        { _id: 3, task: 'Homework', description: 'Make this app super awesome!' }
    ];

    app.get('/api/todos', function index(req, res) {
      res.json({ todos: todos });
    });
    ```

### `todos#show`

1. <details>
    <summary>Create a server route to handle the `GET` request (for one `todo`).</summary>
    ```js
    app.get('/api/todos/:id', function show (req, res) {
        // How would you know which todo is being requested?
    });
    ```
</details>

2. <details>
    <summary>Get the todo id from the URL params and save it to a variable.</summary>
    ```js
    app.get('/api/todos/:id', function show (req, res) {
      var todoId = parseInt(req.params.id);
      // How woud you grab the todo with that id?
    });
    ```
</details>

3. <details>
    <summary>Use the id to find the todo we want to update (remember, we don't have a persistent database yet, so we're using an array called `todos` to represent our "database"). **Hint:** This is a good opportunity to use <a href="https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter" target="_blank">filter</a>.</summary>
    ```js
    app.get('/api/todos/:id', function show(req, res) {
      var todoId = parseInt(req.params.id);

      var foundTodo = todos.filter(function (todo) {
        return todo._id == todoId;
      })[0];

      // What are you going to send back to the client?
    });
    ```
</details>

4. <details>
    <summary>Respond with the found todo.</summary>
    ```js
    app.get('/api/todos/:id', function show(req, res) {
       var todoId = parseInt(req.params.id);

       var foundTodo = todos.filter(function (todo) {
       return todo._id == todoId;
       })[0];

     res.json(foundTodo);
    });
    ```
</details>

### `todos#create`

1. <details>
    <summary>Create a server route to handle the `POST` request.</summary>
    ```js
    app.post('/api/todos', function create(req, res) {
        // Where does the data for the new todo live?
    });
    ```
</details>

2. <details>
    <summary>Create a new todo with form data (`req.body`).</summary>
    ```js
    app.post('/api/todos', function create(req, res) {
      var newTodo = req.body;

      // How would you "save" the new todo? How do you assign it an _id?
    });
    ```
</details>

3. <details>
    <summary>Set a sequential id for the new todo.</summary>
    ```js
    app.post('/api/todos', function create(req, res) {
      var newTodo = req.body;

      if (todos.length > 0) {
        newTodo._id = todos[todos.length - 1]._id + 1;
      } else {
        newTodo._id = 1;
      }

      // How would you "save" the new todo?
    });
    ```
</details>

4. <details>
    <summary>Add the new todo to the `todos` array (our "database").</summary>
    ```js
    app.post('/api/todos', function create(req, res) {
      var newTodo = req.body;

      if (todos.length > 0) {
        newTodo._id = todos[todos.length - 1]._id + 1;
      } else {
        newTodo._id = 1;
      }

      todos.push(newTodo);

      // What do you send back to the client?
    });
    ```
</details>

5. <details>
    <summary>Respond with the new todo.</summary>
    ```js
    app.post('/api/todos', function create(req, res) {
      var newTodo = req.body;

      if (todos.length > 0) {
        newTodo._id = todos[todos.length - 1]._id + 1;
      } else {
        newTodo._id = 1;
      }

      todos.push(newTodo);

      res.json(newTodo);
    });
    ```
</details>

## Resources

* <a href="http://expressjs.com/api.html#req" target="_blank">Express Request Docs</a>
* <a href="http://expressjs.com/api.html#app.get" target="_blank">Express app.get()</a>
* <a href="http://expressjs.com/api.html#app.post.method" target="_blank">Express app.post()</a>

#### Testing Resources

* <a href="http://mochajs.org" target="_blank">Mocha</a> - framework for running tests
* <a href="http://chaijs.com/api" target="_blank">Chai</a> **(expect)** - for *expect* assertions
* <a href="https://github.com/request/request" target="_blank">Request</a> - for handling HTTP requests and responses
