# Testing with Mocha/Chai

> Lesson intro adapted from Gerry Mathe in London

### Learning Objectives

* Explain why we want to write tests for our code
* Explain the difference between unit tests and acceptance tests
* Explain what TDD is
* Explain what BDD is
* Explain the role of Mocha and Chai
* Write tests for our code 

## Why Test?

* Ensure that new code has not broken previous functionality
* No way to manually test everything every single time
* Have automated tests that run before anything is pushed to production
* Deploy and feel good about it

## Unit Tests

Unit tests cover individual units of code, the smallest testable portion of an application. Typically they include functions, methods, single one off tasks. The goal of unit testing is to isolate individual parts of the program and show that they are correct.

  - Forces developers to write modular code for one off tasks
  - When you encounter a failure, it's incredibly easy to pinpoint where the error has occurred within the codebase
  - Find problems early on in the development cycle
  - Prove that the smallest building blocks of your application are functioning correctly

## Acceptance and Integration Tests

Acceptance testing involves performing tests on the entire system. This might include testing your web page in the web browser. It isn't concerned with the minute details of how everything works, just whether it works or not based on business objectives.

  - Hard to diagnose problems because you just know a feature doesn't work, but not sure what segment of the code is failing
  - Many times written by QA testers and business stake holders who are more concerned about overall functionality
  - Often written against user stories, if the story passes that means the feature is working as the client intended

> Acceptance and integration tests tell you whether your code is working and complete; unit tests tell you where it's failing.

## Methodologies

### TDD: Test Driven Development

Unit tests are created before the code itself is written. These tests initially fail, and code is written to make it pass. Tests are then used for regression testing

```
it "after_create an Invoice sets a reminder date to be creation + 20 business days"
it "Account#primary_payment_contact returns the current payment contact or the client project manager"
it "InvoiceChecker#mailer finds invoices that are overdue and sends the email"
```

### BDD: Behavior Driven Development

BDD is an extension/revision of TDD. Tests written are meant to be understood by both the developer and the customer. Focuses more on features and higher level functions of the code, more analagous to acceptance testing than unit testing.

> BDD is a set of best practices for writing great tests. BDD can, and should be, used together with TDD and unit testing methods

```
it "adds a reminder date when an invoice is created"
it "sends an email to the invoice's account's primary contact after the reminder date has passed"
it "marks that the user has read the email in the invoice"
```

## Mocha, Chai

For JavaScript, to test our code we will use two libraries: one to run the tests and a second one to run the assertions.

Mocha will be our testing framework. From the [Mocha website](https://mochajs.org):

_"Mocha is a feature-rich JavaScript test framework running on Node.js and the browser, making asynchronous testing simple and fun. Mocha tests run serially, allowing for flexible and accurate reporting, while mapping uncaught exceptions to the correct test cases."_

For assertions, we will use Chai. From the [Chai website](http://chaijs.com/):

_"Chai is a BDD / TDD assertion library for node and the browser that can be delightfully paired with any javascript testing framework."_

Chai supports 3 assertion styles: 

- should 
- [expect](http://chaijs.com/api/bdd/)
- [assert](http://chaijs.com/api/assert/)

`should` and `expect` are similar with minor differences. `should` inherits from an object's prototype, and there are a few limited use cases where it might not work as expected. For our lesson we'll focus on using `expect`.

> To be able to make HTTP requests inside tests, we could optionally use the `supertest` framework.

## Set Up

To start testing apps, we need to install a couple of dependencies.

First, let's install Mocha, and we will install this package globally using `-g`:

```bash
npm install -g mocha
```

Then we will install Chai using --save-dev

```bash
npm install chai --save-dev
```

**Optional** If we wanted to make HTTP requests we could install supertest:

```bash
npm install supertest --save-dev
```

#### Files and Folders

Now that we're configured, let's set up our file and folder structure. All the tests will be written inside a folder `test` at the root of the app:

```bash
mkdir test
```

Then we can start including test files within:

```bash
test/example_tests.js
test/user_tests.js
test/photo_tests.js
```

## Writing Tests

#### Hooks 

```js
describe('Top level suite', function() {
  describe('Second level test suite', function() {
    
    before(function() {
      // executes once, before all tests 
    });
    
    beforeEach(function() {
      // executes before each test of the suite
    });
    
    after(function() {
      // executes once, after all tests
    });
    
    afterEach(function() {
      // executes after each test of the suite
    });
  });
  
  describe('Another second level test suite', function() {
    
  });
});
```

Create and open the file `array_tests.js`. We now need to require any dependencies at the top of this file:

```javascript
var expect = require('chai').expect;
```

All the tests need to be inside a `describe` function.  We will use one describe block per test suite:

```javascript
describe('Description of the test suite', function() {
  
  it('Test case with one or more assertions to be tested', function() {
    // our test
  });
  
});
```

## We Do

Write tests for testing the built in Array object

```js
// test/array_tests.js
var expect = require('chai').expect;
var items = [];

describe('Array Methods', function() {

  describe('Built in methods', function() {
    beforeEach(function() {
      items.push('John');
      items.push('Jane');
    });

    afterEach(function() {
      items = [];
    });

    it('should return number of array items', function() {
      expect(items).to.have.length(2);
    });

    it('should add a new value', function() {
      items.push('Joe');

      expect(items).to.have.length(3);
    });

    it('should return the first item', function() {
      expect(items.shift()).to.equal('John');
    });

    it('should return the last item', function() {
      expect(items.pop()).to.equal('Jane');
    });

    it('should find a value in the array', function() {
      expect(items.indexOf('John')).to.be.above(-1);
    });

    it('should not find a value in the array', function() {
      expect(items.indexOf('Fake')).to.not.be.above(-1);
    });

    it('should map to new values', function() {
      var mappedItems = items.map(function(val) {
        return val + ' Doe';
      });

      mappedItems.forEach(function(val) {
        expect(val.indexOf(' Doe')).to.be.above(-1);
      });
    });

    it('should filter to one value', function() {
      var filteredItems = items.filter(function(val) {
        return val === 'Jane';
      });

      expect(filteredItems[0]).to.equal('Jane');
    });

    it('should reduce to one string', function() {
      var reduced = items.reduce(function(allNames, name) {
        return allNames + ', ' + name;
      });

      expect(reduced).to.equal('John, Jane');
    });

  });
});
```

## Class Exercise

https://gist.github.com/mdang/5e5e822fbaea7fb65271465d71f50a89

**20 min**

Write tests for the following Array methods: 

- join(':')
- sort()
- concat(arr1, arr2)

## We Do - Testing Custom Code

```js
// test/student_tests.js
var expect = require('chai').expect;
var Student = require('../lib/student');
var john;

describe('Student Object Tests', function() {
  beforeEach(function() {
    john = new Student('John', 'Doe');
  });

  it('should get greeting', function() {
    expect(john.getGreeting()).to.equal('Hello, my name is John');
  });

  it('should return last name', function() {
    expect(john.getLastName()).to.equal('Doe');
  });
});
```

```js
// lib/student.js

function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Student.prototype.getGreeting = function() {
  return 'Hello, my name is ' + this.firstName;
}

Student.prototype.getLastName = function() {
  return this.lastName;
}

module.exports = Student;
```

#### Tips for writing good specs

http://betterspecs.org

* Be clear about what methods you're describing
* Keep the description short, under 40 characters
* Each test should ideally only make one assertion

```js
describe('Maintainable unit test cases...', function() {
  it('should test one type of behavior' );
  it('should not depend on any other test cases.' );
  it('should execute with exact same initial state as any other tests in the suite.' );
  it('should not matter in which order are these tests executed.' );
});
```

## Running Tests

Go to the root of your project in the command line and type `mocha`to run your tests.

## Class Exercise 

https://gist.github.com/mdang/fbb5fff39cf165c1175475b32e0f0b58

**15 min - Pair Exercise**

Think about the Tic Tac Toe project we had. Think through what tests we could write for it. 

## Class Exercise 

https://gist.github.com/mdang/c5fec36fec1e7a11e40f2ef7c5043057

**25 min**

- Codewars signup 
- Run through 2-3 katas with 8 kyu rating
