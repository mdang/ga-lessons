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
