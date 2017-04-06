var request = require('request'),
    expect = require('chai').expect,
    Q = require('q'),
    _ = require('underscore');

TIMEOUT = 200;

var fetcher = (function(request, q) {
  // This module is a wrapper around the request library.
  // It permits method/promise chaining in the tests,
  // and converts server responses to JSON, raising errors
  // if the request takes too long or is in the wrong format.

  return {
    get:  function(action      ){ return fetch("get",   {url: action})             },
    del:  function(action      ){ return fetch("del",   {url: action})             },
    post: function(action, data){ return fetch("post",  {url: action, form: data}) },
    put:  function(action, data){ return fetch("put",   {url: action, form: data}) }
  };

  ////

  function fetch(method, options){
    var deferred = Q.defer();

    setTimeout(function(){
      // Intended to be more intelligible to students than mocha's stock error of
      //    "Error: timeout of 2000ms exceeded. /
      //     Ensure the done() callback is being called in this test."
      deferred.reject(new Error("No Response From Server"))
    }, TIMEOUT);

    request[method](options, function(error, response){
      if(error){
        return deferred.reject(new Error(error));
      }

      try {
        response.json = JSON.parse(response.body);
      } finally {}

      deferred.resolve(response);
    });


    return deferred.promise;
  }

}(request, Q))



var TodoModel = function(){};

// Utility function to fetch all todos from todos#index
// and parse out all, last, and random, for use in tests
TodoModel.prototype.loadAll = function (){
  var self = this;
  var deferred = Q.defer();

  fetcher
    .get(base_url + '/api/todos')
    .then(function(response){
      var all_todos = response.json.todos;
      self.all = all_todos
      self.last = _.last(all_todos)
      self.random = _.sample(all_todos)
      deferred.resolve(self);
    })
    .fail(
      deferred.reject
    )

  return deferred.promise;
}


function ensureJSON(response, done){
  if( typeof(response.json) !== "object" ){
    done(new Error("Response body is the " + typeof(response.body) + " \"" + response.body.toString() + "\" and not valid JSON"));
  } else {
    expect(response.json).to.be.an("object");
    done();
  }
}

/*
  BEGIN TEST SUITE
  note: in order to ensure that records are being persisted/deleted correctly
        on the server, each test uses a before action to hit the `index` route
        first, and then compares those initial records to the test output.
*/

var base_url = 'http://localhost:3000';

describe('Todos API', function() {
  // this.timeout(TIMEOUT); // Overriden by timeout error raised in fetcher module

  describe('GET /api/todos (index)', function(){
    it('should respond with status 200', function (done) {
      fetcher
        .get(base_url + '/api/todos')
        .then(function(response){
          expect(response.statusCode).to.equal(200);
          done();
        })
        .fail(done);
    });

    it('should respond with a javascript object translated into JSON format', function (done) {
      fetcher
        .get(base_url + '/api/todos')
        .then(function(response) {
          ensureJSON(response, done);
        })
        .fail(done);
    });

    it('the JSON object should have one key-value pair. The key should be called "todos." That key should hold an array of todos', function (done) {
      fetcher
        .get(base_url + '/api/todos')
        .then(function (response) {
          expect(response.json)
            .to.have.property("todos")
            .and.be.an("array")
              .and.have.property(0)
              .and.have.all.keys(["task", "description", "_id"]);

          done();
        })
        .fail(done);
    });

    it('todo objects should have properities: _id, description, task', function (done) {
      fetcher
        .get(base_url + '/api/todos')
        .then(function (response) {
          var first_todo = response.json.todos[0]

          expect(first_todo)
            .to.have.property("task")
            .and.to.be.a("string");

          expect(first_todo)
            .to.have.property("description")
            .and.to.be.a("string");

          expect(first_todo)
            .to.have.property("_id")
            .and.to.be.a("number");

          done();
        })
        .fail(done);
    });
  });


  describe('GET /api/todos/:id (show)', function(){

    var actual_response = {};
    var Todo = new TodoModel;

    before(function(done){
      Todo.loadAll()
        .then(function(){
          fetcher
            .get(base_url + '/api/todos/' + Todo.random._id)
            .then(function (response) {
                actual_response.statusCode = response.statusCode;
                actual_response.json = response.json;
                done();
              })
            .fail(done);
        })
        .fail(done);
    });

    it('should respond with status 200 - Success', function (done) {
      expect(actual_response.statusCode).to.equal(200);
      done();
    });

    it('should respond with JSON', function (done) {
      ensureJSON(actual_response, done);
    });

    it('should fetch one specific todo by _id', function (done) {
      expect(actual_response.json)
        .to.have.property("task")
        .and.equal(Todo.random.task);

      expect(actual_response.json)
        .to.have.property("description")
        .and.equal(Todo.random.description);

      expect(actual_response.json)
        .to.have.property("_id")
        .and.equal(Todo.random._id);

      done();
    });
  });

  describe('POST /api/todos (create)', function(){

    var actual_response = {};
    var Todo = new TodoModel;
    var new_todo = {
      task: 'Create random task name #' + Math.random(),
      description: 'Pick a random number, e.g. ' + Math.random()
    };

    before(function(done){
      fetcher
        .post(base_url + '/api/todos', new_todo)
        .then(function(response) {
            actual_response.statusCode = response.statusCode;
            actual_response.json = response.json;
            done();
        })
        .fail(done);
    })


    it('should respond with status 200 - Success', function (done) {
      expect(actual_response.statusCode).to.equal(200);
      done();
    });

    it('should respond with JSON', function (done) {
      ensureJSON(actual_response, done);
    });

    it('should respond with the new todo object', function (done) {
      expect(actual_response.json)
        .to.have.property("task")
        .and.equal(new_todo.task);

      expect(actual_response.json)
        .to.have.property("description")
        .and.to.equal(new_todo.description);

      done();
    });

    it('should assign an _id to the new todo object', function (done) {
      expect(actual_response.json).to.have.property("_id");
      done();
    });

    it('should increment the _id number by one each time a todo is created', function (done) {
      var previous_id = actual_response.json._id;
      expect(previous_id).to.be.a("number");

      // we're creating the same todo again, but the _id should be different this time!
      fetcher
        .post(base_url + '/api/todos', new_todo)
        .then(
          function(response) {
            expect(response.json)
              .to.have.property("_id")
              .and.to.be.above(previous_id);
            done();
          }
        )
        .fail(done)
    });

  });

  describe('DELETE /api/todos/:id (destroy)', function(){

    var actual_response = {}
    var Todo = new TodoModel;

    before(function(done){
      Todo.loadAll()
        .then(function(){
          fetcher
            .del(base_url + '/api/todos/' + Todo.random._id)
            .then(function(response) {
              actual_response.statusCode = response.statusCode;
              actual_response.json = response.json;
              done();
            })
            .fail(done)
        })
        .fail(done)
    });

    it('should respond with 200 or 204 on success', function(done) {
      expect([200,204]).to.include(actual_response.statusCode);
      done();
    });

    it('should delete one specific todo from the list of todos', function (done) {
      fetcher
        .get(base_url + '/api/todos')
        .then(function(response){
          var current_todos = response.json.todos;
          expect(current_todos)
            .to.have.length(Todo.all.length - 1)
            .and.not.deep.include(Todo.random);

          done();
        })
      .fail(done)
    });
  });


  describe('PUT /api/todos/:id (update)', function(){

    var actual_response = {};
    var Todo = new TodoModel;
    var updated_todo = {
      task: 'Return order #' + Math.random(),
      description: 'Shipping label #' + Math.random()
    };

    before(function(done){
      Todo.loadAll()
        .then(function(){
          fetcher
            .put(base_url + '/api/todos/' + Todo.random._id, updated_todo)
            .then(function (response) {
              actual_response.statusCode = response.statusCode;
              actual_response.json = response.json;
              Todo.original_todo = Todo.random;
              done();
            })
            .fail(done);

        })
        .fail(done);
    });

    it('should respond with status 200 - Success', function (done) {
      expect(actual_response.statusCode).to.equal(200);
      done();
    });

    it('should respond with JSON', function (done) {
      ensureJSON(actual_response, done);
    });

    it('should update the properities of one specific todo', function (done) {
      expect(actual_response.json)
        .to.have.property("task")
        .and.to.equal(updated_todo.task);

      expect(actual_response.json)
        .to.have.property("description")
        .and.equal(updated_todo.description);

      expect(actual_response.json)
        .to.have.property("_id")
        .and.equal(Todo.original_todo._id);

      done();
    });
  });


  describe('GET /api/todos/search (search)', function(){

    var actual_response = {};
    var Todo = new TodoModel;
    var search_word = _.sample(["surf", "sperlunk", "ski"])
    var updated_todo = {
      task: search_word,
      description: 'dude... ' + Math.random()
    };

    before(function(done){
      Todo.loadAll()
        .then(function(){
          fetcher
            .put(base_url + '/api/todos/' + Todo.random._id, updated_todo)
            .then(function(response){
              Todo.original_todo = response.json;
              done();
            })
            .fail(done)
        })
        .fail(done)
    });

    it('should list all todos that contain the search term from the query parameter (e.g. `?q=discover`) in the task field', function(done){
      fetcher
        .get(base_url + '/api/todos/search?q=' + search_word)
        .then(function(response){
          expect(response.json)
            .to.have.property("todos")
            .and.be.an("array")
            .and.deep.include(Todo.original_todo);
          done();
        })
        .fail(done);
    });

  });
});
