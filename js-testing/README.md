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
- Why does everyone not write tests and do TDD? 
  * Clients often don't want to pay for it if being billed hourly. "Oh, you wouldn't just do the job right the first time?"
  * Promotional websites that don't last too long
  * Startup who is unsure about product and testing waters 

- **Unit Testing**

- **Acceptance/Integration Testing**

- **TDD**
  * Engineering focused, specific to bits of functionality
  * Test-coverage refers to the percentage of your code that is tested automatically, so a higher number is better
  * Steps:
    1. Write tests that fail 
    2. Write code that makes the test pass
    3. Refactor code 
    4. Add more tests as needed 

- **BDD** 
    * BDD focuses on the behavioural aspect of the system rather than the implementation aspect of the system that TDD focuses on.
    * BDD gives a clearer understanding as to what the system should do from the perspective of the developer and the customer. TDD only gives the developer an understanding of what the system should do.
    * BDD allows both the developer and the customer to work together to on requirements analysis that is contained within the source code of the system.

- Considerations for BDD vs TDD 
  * TDD is very popular, but consider where the company is. If you're a startup, you're more likely to need to shift/pivot very frequently and you'll be writing more throw away code. TDD takes time. When your product starts becoming more solid or you're developing a version 2 product, consider going with TDD in my opinion 
  * BDD is relevant for stakeholders and tests the bigger picture. This might be more appropriate to start off with
