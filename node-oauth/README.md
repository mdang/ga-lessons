## OAuth

### Learning Objectives

* Explain what OAuth is and what it is used for
* Generate access tokens from client keys and secrets
* Explain the benefits of using OAuth and limiting an Application's scope
* Diagram the OAuth flow between user, client, and server
* Register a new application with a 3rd party like Facebook or Instagram
* Add support for 3rd party logins in an application
* Request resources using an access token

## Outline 

- Lecture through OAuth, how it differs from session and token based auth
- Register a new Instagram app - https://instagram.com/developer
  - NOTE: If everyone in class tries to create an application at once it won't work, it's coming from a single IP address and looks suspicious. It's better if one person creates an app and shares the client id/secret at this point 
- Go through the OAuth walkthrough for creating an access token - https://www.instagram.com/developer/authentication/

```js
// routes/index.js
var express = require('express');
var router = express.Router();
var request = require('request');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/callback', function(req, res) {
  var code = req.query.code;

  console.log('code: ', code);
  var data = {
    client_id: process.env.INSTAGRAM_CLIENT_ID,
    client_secret: process.env.INSTAGRAM_CLIENT_SECRET,
    grant_type: 'authorization_code',
    redirect_uri: 'http://localhost:3000/callback',
    code: code
  };

  request.post({
    url: 'https://api.instagram.com/oauth/access_token',
    formData: data },
    function(err, response, body) {
      if (err) {
        console.error('Request failed:', err);
      }

      var body = JSON.parse(body);

      console.log('response', response);
      console.log('body', body);

      res.redirect('/?access_token=' + body.access_token);
    });
});

module.exports = router;


```
