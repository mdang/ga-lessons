# API Authentication 

### Learning Objectives

* Explain why we would want to require authentication for our API
* Explain how traditional website authentication differs from API authentication
* Describe how JWT's work and what makes them efficient
* Use middleware in Express to lock down specific endpoints
* Add an authorization header in Postman to authenticate an API request
* Allow a user to obtain access to an API with a username/password

## Outline 

### Morning

* Review traditional website authentication with cookies and sessions 
* Explain why we use Auth0
* Go over how authentication with an API differs, and how it affects Single Page Applications
  - Draw on whiteboard traditional with sessions/cookies, next to it draw with JWT authentication and compare
* Go over different parts of a JWT, why it's becoming a standard 
* Set up a new Single Page App in Auth0
* Download sample front-end app, get JWT that's stored in localStorage
* Examine the JWT we get back, decode it
* Create a new Express API for todo app
* Create placeholder routes for `api/todos`
* Create model for `Todo`

### Afternoon

* Add `express-jwt` middleware for checking JWT
* Use Postman to add an authorization header and check endpoints 
* Create a front-end app that utilizes the JWT to send to backend Todo API

## Completed Code 

```js
// app.js (backend)
require('dotenv').config({ silent: true });

var express = require('express');
var path = require('path');
var favicon = require('serve-favicon');
var logger = require('morgan');
var cookieParser = require('cookie-parser');
var bodyParser = require('body-parser');
var cors = require('cors');

var index = require('./routes/index');
var users = require('./routes/users');
var todos = require('./routes/todos');

var jwt = require('express-jwt');
var jwtCheck = jwt({
  secret: process.env.AUTH0_CLIENT_SECRET,
  audience: process.env.AUTH0_CLIENT_ID
});

var app = express();

var mongoose = require('mongoose');
mongoose.connect(process.env.TODOS_DB_CONN);

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(cors());

// uncomment after placing your favicon in /public
//app.use(favicon(path.join(__dirname, 'public', 'favicon.ico')));
app.use(logger('dev'));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use('/', index);
app.use('/users', users);
app.use('/api/todos', jwtCheck, todos);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;

```

```js
// models/todo.js
var mongoose = require('mongoose');

var schema = new mongoose.Schema({
  description: { type: String, required: true },
  completed: { type: Boolean, default: false },
  createdAt: { type: Date, default: Date.now },
  dueDate: Date,
  userId: { type: String, required: true, index: true }
});

var Todo = mongoose.model('Todo', schema);

// Make this available to our other files
module.exports = Todo;

```

```js
// routes/todos.js
var express = require('express');
var router = express.Router();

var Todo = require('../models/todo');

// GET all todos
router.get('/', function(req, res, next) {
  console.log('req.user ', req.user);
  var userId = req.user.sub;

  Todo.find({ userId: userId }, function(err, todos) {
    if (err) {
      console.log('DB Error:', err);
      res.status(500).json({});
    }

    res.json(todos);
  });
});

// GET single todo
router.get('/:todoId', function(req, res) {
  Todo.findById(req.params.todoId, function(err, todo) {
    if (err) {
      console.log('DB Error: ', err);
      res.status(500).json({});
    }

    if (!todo) {
      res.status(404).json({});
    }

    res.json(todo);
  });
});

// POST create a new todo
router.post('/', function(req, res) {
  var desc = req.body.desc;
  var userId = req.user.sub;
  var dueDate = null;

  var newTodo = new Todo({
    description: desc,
    userId: userId
  });

  newTodo.save(function(err, todo) {
    if (err) {
      console.log('DB Error: ', err);
      res.status(500).json({});
    }

    res.json(todo);
  });
});

// DELETE a todo
router.delete('/:todoId', function(req, res) {
  res.json({
    deleted: req.params.todoId
  });
});

function updateTodo(req, res) {
  res.json({
    todoId: req.params.todoId,
    updated: true
  });
}

// UPDATE an existing todo
router.put('/:todoId', updateTodo);
router.patch('/:todoId', updateTodo);


module.exports = router;

```
