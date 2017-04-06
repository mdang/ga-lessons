## Testing

### Lesson Objectives

* Explain why we want to write tests for our code
* Explain the difference between unit tests and acceptance tests.
* Explain what TDD is
* Explain what BDD is
* Explain what RSpec is and why it's useful
* Describe how to write good specs
* Explain what Selenium is and why it's useful
* Write unit tests for models using Rspec

### Why do we want to write tests for our code?

* Ensure that new code has not broken previous functionality
* No way to manually test everything every single time
* Have automated tests that run before anything is pushed to production
* Deploy and feel good about it

### Unit Tests

Unit tests cover individual units of code, the smallest testable portion of an application. Typically they include functions, methods, single one off tasks. The goal of unit testing is to isolate individual parts of the program and show that they are correct.

**Advantages** 

  - Forces developers to write modular code for one off tasks
  - When you encounter a failure, it's incredibly easy to pinpoint where the error has occurred within the codebase
  - Find problems early on in the development cycle
  - Prove that the smallest building blocks of your application are functioning correctly

### Acceptance Tests

Acceptance testing involves performing tests on the entire system. This might include testing your web page in the web browser. It isn't concerned with the minute details of how everything works, just whether it works or not based on business objectives.

  - Hard to diagnose problems because you just know a feature doesn't work, but not sure what segment of the code is failing
  - Many times written by QA testers and business stake holders who are more concerned about overall functionality
  - Often written against user stories, if the story passes that means the feature is working as the client intended

### Selenium 

Selenium is a portable software testing framework for web applications. Selenium provides a record/playback tool for authoring tests without any programming. 

It also provides a Domain Specific Language called Selanese that you can use in popular programming languages and tests can be run against modern web browsers. 

Saucelabs - https://saucelabs.com

### TDD

Test Driven Development

Unit tests are created before the code itself is written. These tests initially fail, and code is written to make it pass. Tests are then used for regression testing

### BDD

Behavior Driven Development is an extension/revision of TDD. Tests written are meant to be understood by both the developer and the customer. Focuses more on features and higher level functions of the code, more analagous to acceptance testing than unit testing.

### Rspec

Rspec is a Behavior Driven Developement framework for testing applications in Ruby. It isn't tied to Rails, you can use it independently. 

`gem install rspec`

`rspec --init`

* Use `describe` to describe the basic behavior of the class
* Tests are written using the `it` block
* You can set up test state with `before` and `after`, which is run before and after each test is run
* The `context` block allows us to group tests, especially useful for grouping tests for the same functionality with different inputs/states

```RUBY
# Testing for our User class
describe User do
  context 'with admin privileges' do
    before :each do
      @admin = Admin.get(1)
    end
 
    it 'should exist' do
      expect(@admin).not_to be_nil
    end
 
    it 'should have a name' do
      expect(@admin.name).not_to be_false
    end
  end
 
  #...
end
```

This is quite different from what pure unit tests, which would look more like: 

```RUBY
require_relative "simple_number"
require "test/unit"
 
class TestSimpleNumber < Test::Unit::TestCase
 
  def test_simple
    assert_equal(4, SimpleNumber.new(2).add(2) )
    assert_equal(6, SimpleNumber.new(2).multiply(3) )
  end
 
end
```

### How to write good specs

http://betterspecs.org

* Be clear about what methods you're describing
  - Use the convention of '.' (e.g. '.authenticate') for class methods
  - Use '#' (e.g. '#admin?' when referring to ana instance method's name
* Use contexts to make tests clear and organized

```RUBY
context 'when logged in' do
  it { is_expected.to respond_with 200 }
end
context 'when logged out' do
  it { is_expected.to respond_with 401 }
end
```

* Keep the description short, under 40 characters
* Each test should only make one assertion
