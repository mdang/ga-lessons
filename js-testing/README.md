# Testing with Mocha/Chai

### Learning Objectives

* Explain why we want to write tests for our code
* Explain the difference between unit tests and acceptance tests
* Explain what TDD is
* Explain what BDD is
* Explain the role of Mocha and Chai
* Write tests for our code

## Outline

- History of testing 
  * Manual testing of websites, downsides. Experience with Tribal DDB and our QA process
  * Need way of catching developers when they deploy code and not find out from consumers something is broken 
- Discuss why testing is important 
  * Deploy with confidence. Companies like uShip can have developers contribute to production code on day 1 with confidence 
  * For large systems, it's nearly impossible for any single developer/team to know how all the pieces fit together. [Blind men and an elephant](https://en.wikipedia.org/wiki/Blind_men_and_an_elephant). We need testing to ensure one team doesn't break something else from another team 
  * Automate testing with CI 

- Unit Testing 

- Acceptance/Integration Testing

- TDD 
  * Engineering focused, specific to bits of functionality
    1. Write tests that fail 
    2. Write code that makes the test pass
    3. Refactor code 
    4. Add more tests as needed 

- BDD 
