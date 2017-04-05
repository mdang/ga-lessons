# https://www.github.com/ga-wdi-exercises/whenpresident 
> This commit history created using [Diffshot](https://github.com/RobertAKARobin/diffshot)


## Table of Contents
- [a308a41: Added sessions](#added-sessions)
  - [index.js](#added-sessions-indexjs)
  - [package.json](#added-sessions-packagejson)
- [34e2e66: Added env.json](#added-envjson)
  - [.gitignore](#added-envjson-gitignore)
  - [env.json](#added-envjson-envjson)
  - [index.js](#added-envjson-indexjs)
- [5e81578: Added Twitter environment variables](#added-twitter-environment-variables)
  - [env.json](#added-twitter-environment-variables-envjson)
  - [index.js](#added-twitter-environment-variables-indexjs)
- [0efb248: Gets request token from Twitter](#gets-request-token-from-twitter)
  - [index.js](#gets-request-token-from-twitter-indexjs)
  - [package.json](#gets-request-token-from-twitter-packagejson)
- [2bd11a3: Redirects to Twitter](#redirects-to-twitter)
  - [index.js](#redirects-to-twitter-indexjs)
  - [package.json](#redirects-to-twitter-packagejson)
- [4715a7a: Saves OAuth tokens via sessions; added logout button](#saves-oauth-tokens-via-sessions-added-logout-button)
  - [index.js](#saves-oauth-tokens-via-sessions-added-logout-button-indexjs)
  - [views/layout-main.hbs](#saves-oauth-tokens-via-sessions-added-logout-button-viewslayout-mainhbs)
- [b2eb0f5: Gets Twitter permanent oauth_tokens](#gets-twitter-permanent-oauth_tokens)
  - [index.js](#gets-twitter-permanent-oauth_tokens-indexjs)
- [9971d27: Saves Twitter account info to sessions](#saves-twitter-account-info-to-sessions)
  - [index.js](#saves-twitter-account-info-to-sessions-indexjs)
- [6255557: Gets Twitter info about current user](#gets-twitter-info-about-current-user)
  - [index.js](#gets-twitter-info-about-current-user-indexjs)
- [9ef5b75: Saves or updates Twitter user as a Candidate](#saves-or-updates-twitter-user-as-a-candidate)
  - [db/connection.js](#saves-or-updates-twitter-user-as-a-candidate-dbconnectionjs)
  - [index.js](#saves-or-updates-twitter-user-as-a-candidate-indexjs)
- [a51aeea: Makes current_user accessible in views](#makes-current_user-accessible-in-views)
  - [index.js](#makes-current_user-accessible-in-views-indexjs)
  - [views/layout-main.hbs](#makes-current_user-accessible-in-views-viewslayout-mainhbs)
- [40acb6f: Candidates can be created only by signing up](#candidates-can-be-created-only-by-signing-up)
  - [index.js](#candidates-can-be-created-only-by-signing-up-indexjs)
  - [public/html/candidates-index.html](#candidates-can-be-created-only-by-signing-up-publichtmlcandidates-indexhtml)
  - [public/html/candidates-show.html](#candidates-can-be-created-only-by-signing-up-publichtmlcandidates-showhtml)
  - [public/js/app.js](#candidates-can-be-created-only-by-signing-up-publicjsappjs)
- [da868c8: Candidates can delete and update themselves only](#candidates-can-delete-and-update-themselves-only)
  - [index.js](#candidates-can-delete-and-update-themselves-only-indexjs)
  - [public/html/candidates-show.html](#candidates-can-delete-and-update-themselves-only-publichtmlcandidates-showhtml)
  - [public/js/app.js](#candidates-can-delete-and-update-themselves-only-publicjsappjs)
- [b0cc736: Delete and update forms show up only for current user](#delete-and-update-forms-show-up-only-for-current-user)
  - [index.js](#delete-and-update-forms-show-up-only-for-current-user-indexjs)
  - [public/html/candidates-show.html](#delete-and-update-forms-show-up-only-for-current-user-publichtmlcandidates-showhtml)
  - [public/js/app.js](#delete-and-update-forms-show-up-only-for-current-user-publicjsappjs)
- [982cff4: Looks for env.json only in development](#looks-for-envjson-only-in-development)
  - [index.js](#looks-for-envjson-only-in-development-indexjs)

# Setup

```
$ git clone git@github.com:ga-wdi-exercises/whenpresident.git whenprez-auth
$ cd whenprez-auth
$ git checkout c1667dd
$ git checkout -b auth-starter
```

**Note**: There's a *lot* of opportunity for typos in this walkthrough. There are several particularly complicated pieces of code that are mostly just boilerplate. Because typing them out doesn't really "teach" much, they have been included as plain text so that you can copy and paste them.

**Note**: A easily-testable goal is listed for each of the OAuth steps. Achieving the goal means you're on the right track! Your goal up to the first "STOP" is just to be able to run `nodemon` without errors.

# Added sessions

> [a308a41](https://www.github.com/ga-wdi-exercises/whenpresident/commit/a308a41)

<details>
  <summary>What is a session variable? Why is it called a "session" variable?</summary>
  <blockquote>A session variable is a piece of data that's associated with a specific instance of a specific computer accessing your site. If Alice and Bob are both accessing your site, they both have their own "sessions".</blockquote>
</details>

<details>
  <summary>What are the two new things being `require`d in this app? How do you install them?</summary>
  <blockquote>`express-session` and `connect-mongo`. You install them with `npm install --save express-session` and `npm install --save connect-mongo`.</blockquote>
</details>

<details>
  <summary>What does a session "secret" do?</summary>
  <blockquote>Sessions are encrypted. A "secret" is some "junk" data added to your *real* data during the encryption process to make it harder to decrypt.</blockquote>
</details>

<details>
  <summary>How does `connect-mongo` relate to sessions?</summary>
  <blockquote>Session data has to be stored somewhere. There are several options, one of which is to store it in a database. `connect-mongo` enables us to store session data in the Mongo database.</blockquote>
</details>

### [Added sessions: `package.json`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/a308a41/package.json)
![Added sessions, package.json](_DIFFSHOTS/added-sessions.package-json.png)

### [Added sessions: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/a308a41/index.js)
![Added sessions, index.js](_DIFFSHOTS/added-sessions.index-js.png)

```js
app.use(session({
  secret: "some random string",
  resave: false,
  saveUninitialized: false,
  store: new MongoSession({
    mongooseConnection: mongoose.connection
  })
}));
```

# Added env.json

> [34e2e66](https://www.github.com/ga-wdi-exercises/whenpresident/commit/34e2e66)

<details>
  <summary>What is an environment variable? Why is it called an "environment" variable?</summary>
  <blockquote>An environment variable is a piece of data associated with the computer that's running your server. The computer on which the server is running is considered the "environment". 3 computers are 3 different environments.</blockquote>
</details>

<details>
  <summary>Why do we use environment variables?</summary>
  <blockquote>Because the data for the variables is specific to one single environment. You're not going to share environment variables with someone else: you won't include them on Github, for example. Environment variables are therefore great for data that needs to be kept secure, like API keys or encryption data.</blockquote>
</details>

<details>
  <summary>Why is it necessary to `gitignore` environment variables?</summary>
  <blockquote>To prevent environment variables from being pushed to Github, where hackers could see them.</blockquote>
</details>

<details>
  <summary>What does the `process` variable do?</summary>
  <blockquote>It stores functions and data relevant to the current "process", like environment variables. A process is a program that is running on your computer. The process in this case is this particular instance of Node running.</blockquote>
</details>

### [Added env.json: `.gitignore`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/34e2e66/.gitignore)
![Added env.json, .gitignore](_DIFFSHOTS/added-envjson.-gitignore.png)

### [Added env.json: `env.json`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/34e2e66/env.json)
![Added env.json, env.json](_DIFFSHOTS/added-envjson.env-json.png)

### [Added env.json: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/34e2e66/index.js)
![Added env.json, index.js](_DIFFSHOTS/added-envjson.index-js.png)

# Added Twitter environment variables

> [5e81578](https://www.github.com/ga-wdi-exercises/whenpresident/commit/5e81578)

<details>
  <summary>What's the difference between a "key" and a "secret"?</summary>
  <blockquote>The same as the difference between a username and a password. You need both to change data or access private data. But you can use the username (the "key") to let other people know you are who you say you are.</blockquote>
</details>

### [Added Twitter environment variables: `env.json`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/5e81578/env.json)
![Added Twitter environment variables, env.json](_DIFFSHOTS/added-twitter-environment-variables.env-json.png)

```json
{
  "session_secret": "a long random string",
  "t_callback_url": "http://127.0.0.1:3001/login/twitter/callback",
  "t_consumer_key": "provided by twitter",
  "t_consumer_secret": "provided by twitter"
}
```

### [Added Twitter environment variables: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/5e81578/index.js)
![Added Twitter environment variables, index.js](_DIFFSHOTS/added-twitter-environment-variables.index-js.png)

```js
process.env.t_callback_url = env.t_callback_url;
process.env.t_consumer_key = env.t_consumer_key;
process.env.t_consumer_secret = env.t_consumer_secret;
```

-----
# STOP
-----

# Gets request token from Twitter

> [0efb248](https://www.github.com/ga-wdi-exercises/whenpresident/commit/0efb248)

## This is OAuth's 1st "Leg"

#### Your goal: When you go to `/login/twitter` you end up with some promising-looking JSON.

### [Gets request token from Twitter: `package.json`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/0efb248/package.json)
![Gets request token from Twitter, package.json](_DIFFSHOTS/gets-request-token-from-twitter.package-json.png)

### [Gets request token from Twitter: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/0efb248/index.js)
![Gets request token from Twitter, index.js](_DIFFSHOTS/gets-request-token-from-twitter.index-js.png)

```js
var postData = {
  url:    "https://api.twitter.com/oauth/request_token",
  oauth:  {
    callback:         process.env.t_callback_url,
    consumer_key:     process.env.t_consumer_key,
    consumer_secret:  process.env.t_consumer_secret
  }
};
```

<details>
  <summary>Request is a Node module that is similar to which Ruby gem?</summary>
  <blockquote>It's similar to HTTParty. You can use it to let your server **make** HTTP requests, rather than just **respond** to HTTP requests.</blockquote>
</details>

<details>
  <summary>What are the two arguments in a `request` callback?</summary>
  <blockquote>Any errors returned by the request, and then the data returned by the request.</blockquote>
</details>

# Redirects to Twitter

> [2bd11a3](https://www.github.com/ga-wdi-exercises/whenpresident/commit/2bd11a3)

## This is OAuth's 2nd Leg

#### Your goal: When you go to `/login/twitter` you're redirected to a Twitter "Sign-in" or "Authorize" page.

<details>
  <summary>What's a "querystring"?</summary>
  <blockquote>A piece at the end of a URL that contains additional parameters. It always begins with a `?` and consists of a bunch of key/value pairs separated by `&`. For example: http://google.com/search?q=querystrings&ie=UTF8</blockquote>
</details>

<details>
  <summary>Where does `req.session` "physically" save data?</summary>
  <blockquote>Since we're using `connect-mongo`, it saves it in the Mongo database.</blockquote>
</details>

### [Redirects to Twitter: `package.json`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/2bd11a3/package.json)
![Redirects to Twitter, package.json](_DIFFSHOTS/redirects-to-twitter.package-json.png)

### [Redirects to Twitter: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/2bd11a3/index.js)
![Redirects to Twitter, index.js](_DIFFSHOTS/redirects-to-twitter.index-js.png)

```js
var querystring = qstring.stringify({
  oauth_token: response.oauth_token
});
```
```
"https://api.twitter.com/oauth/authenticate?"
```

<details>
  <summary>What does `qstring.parse` do?</summary>
  <blockquote>It turns a querystring into a Javascript object literal.</blockquote>
</details>

-----
# STOP
-----

# Saves OAuth tokens via sessions; added logout button

> [4715a7a](https://www.github.com/ga-wdi-exercises/whenpresident/commit/4715a7a)

#### Your goal: When you go to `/login/twitter` you're redirected to Twitter, then redirected back to a page that shows a bunch of JSON.

Also, if you check out `mongo`, you'll now see a `sessions` collection.

<details>
  <summary>What's the relation between `app.get("/login/twitter/callback")` and the `t_callback_url` we've specified?</summary>
  <blockquote>The `t_callback_url` tells Twitter to which URL it should send users once they've signed in. `app.get` is the "receiving-end" of that URL.</blockquote>
</details>

### [Saves OAuth tokens via sessions; added logout button: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/4715a7a/index.js)
![Saves OAuth tokens via sessions; added logout button, index.js](_DIFFSHOTS/saves-oauth-tokens-via-sessions-added-logout-button.index-js.png)

```js
req.session.temp_token  = response.oauth_token;
req.session.temp_secret = response.oauth_token_secret;
```

### [Saves OAuth tokens via sessions; added logout button: `views/layout-main.hbs`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/4715a7a/views/layout-main.hbs)
![Saves OAuth tokens via sessions; added logout button, views/layout-main.hbs](_DIFFSHOTS/saves-oauth-tokens-via-sessions-added-logout-button.views-layout-main-hbs.png)

# Gets Twitter permanent oauth_tokens

> [b2eb0f5](https://www.github.com/ga-wdi-exercises/whenpresident/commit/b2eb0f5)

## This is OAuth's 3rd Leg

#### Your goal: When you're redirected back from Twitter, you get some JSON that contains your Twitter screen name.

### [Gets Twitter permanent oauth_tokens: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/b2eb0f5/index.js)
![Gets Twitter permanent oauth_tokens, index.js](_DIFFSHOTS/gets-twitter-permanent-oauthtokens.index-js.png)

```js
var postData = {
  url: "https://api.twitter.com/oauth/access_token",
  oauth: {
    consumer_key:     process.env.t_consumer_key,
    consumer_secret:  process.env.t_consumer_secret,
    token:            req.session.temp_token,
    token_secret:     req.session.temp_secret,
    verifier:         querystring.oauth_verifier
  }
};
```

<details>
  <summary>What is `req.query`? How is it different from `req.params`?</summary>
  <blockquote>`req.query` is the data in the querystring at the end of the URL. `req.params` are the variables included in the URL itself that you defined when you set up the route, e.g. `app.get("/candidate/:name")`.</blockquote>
</details>

-----
# STOP
-----

# Saves Twitter account info to sessions

> [9971d27](https://www.github.com/ga-wdi-exercises/whenpresident/commit/9971d27)

#### Your goal: If you look at the `sessions` collection in `mongo`, you'll see `t_user_id`, `t_screen_name`, and `t_oauth_data` fields.

### [Saves Twitter account info to sessions: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/9971d27/index.js)
![Saves Twitter account info to sessions, index.js](_DIFFSHOTS/saves-twitter-account-info-to-sessions.index-js.png)

```js
req.session.t_user_id           = response.user_id;
req.session.t_screen_name       = response.screen_name;
req.session.t_oauth_data        = {
  token:            response.oauth_token,
  token_secret:     response.oauth_token_secret,
  consumer_key:     process.env.t_consumer_key,
  consumer_secret:  process.env.t_consumer_secret
};
```

<details>
  <summary>Why is all this OAuth information being saved to a single `req.session.t_oauth` object?</summary>
  <blockquote>It contains the data we'll need to send with every API request.</blockquote>
</details>

# Gets Twitter info about current user

> [6255557](https://www.github.com/ga-wdi-exercises/whenpresident/commit/6255557)

#### Your goal: When you're redirected back from Twitter, you'll see a lot of JSON that contains information about your Twitter account, including your profile picture.

See the bonus below!

### [Gets Twitter info about current user: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/6255557/index.js)
![Gets Twitter info about current user, index.js](_DIFFSHOTS/gets-twitter-info-about-current-user.index-js.png)

```js
var apiRequestParameters = {
  url:    "https://api.twitter.com/1.1/users/show.json",
  json:   true,
  oauth:  req.session.t_oauth_data,
  qs:     {
    screen_name: req.session.t_screen_name
  }
};
```

## Bonus: Get any Twitter user's most recent Tweets

Make a GET request to:

`https://api.twitter.com/1.1/statuses/user_timeline.json`

...with two parameters in the querystring:

- `screen_name`: The screen name of any Twitter user (try `GA_DC`!)
- `count`: How many Tweets you want back. (I recommend `5` or fewer, or it takes a long time.)

-----
# STOP
-----

# Saves or updates Twitter user as a Candidate

> [9ef5b75](https://www.github.com/ga-wdi-exercises/whenpresident/commit/9ef5b75)

<details>
  <summary>How should you choose which data returned from the Twitter API to actually save to the database?</summary>
  <blockquote>Saving all of it is do-able, but inefficient. I would recommend saving the things you're going to use in the rest of your program the most frequently: the screen name and the photo URL in this case.</blockquote>
</details>

### [Saves or updates Twitter user as a Candidate: `db/connection.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/9ef5b75/db/connection.js)
![Saves or updates Twitter user as a Candidate, db/connection.js](_DIFFSHOTS/saves-or-updates-twitter-user-as-a-candidate.db-connection-js.png)

### [Saves or updates Twitter user as a Candidate: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/9ef5b75/index.js)
![Saves or updates Twitter user as a Candidate, index.js](_DIFFSHOTS/saves-or-updates-twitter-user-as-a-candidate.index-js.png)

```js
var candidate_info  = {
  name:         response.body.name,
  screen_name:  response.body.screen_name,
  photo_url:    response.body.profile_image_url
};
var search_params   = {
  screen_name:  response.body.screen_name
};
```

<details>
  <summary>Why use `findOneAndUpdate`? Why not just `create`?</summary>
  <blockquote>That would create a new User for the person signing in every time they sign in.</blockquote>
</details>

# Makes current_user accessible in views

> [a51aeea](https://www.github.com/ga-wdi-exercises/whenpresident/commit/a51aeea)

### [Makes current_user accessible in views: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/a51aeea/index.js)
![Makes current_user accessible in views, index.js](_DIFFSHOTS/makes-currentuser-accessible-in-views.index-js.png)

### [Makes current_user accessible in views: `views/layout-main.hbs`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/a51aeea/views/layout-main.hbs)
![Makes current_user accessible in views, views/layout-main.hbs](_DIFFSHOTS/makes-currentuser-accessible-in-views.views-layout-main-hbs.png)

<details>
  <summary>Why is `app.use` called "middle"ware?</summary>
  <blockquote>Because it happens in the "middle" of requests. The user goes to a URL, then Express runs its middleware, then Express routes the request.</blockquote>
</details>

<details>
  <summary>What's the difference between `res.locals` and `req.session`?</summary>
  <blockquote>`res.locals` makes things available in views. `req.session` saves it as a session variable</blockquote>
</details>

<details>
  <summary>What's the purpose of the `next` function?</summary>
  <blockquote>It tells Express when to move on from a particular piece of middleware. Without it, Express will just hang forever. It's necessary because you can put `next()` inside callback functions. It lets you say, "Hey, Express, only move on from this piece of middleware once this asynchronous thing has compelted."</blockquote>
</details>

-----
# STOP
-----

# Candidates can be created only by signing up

> [40acb6f](https://www.github.com/ga-wdi-exercises/whenpresident/commit/40acb6f)

### [Candidates can be created only by signing up: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/40acb6f/index.js)
![Candidates can be created only by signing up, index.js](_DIFFSHOTS/candidates-can-be-created-only-by-signing-up.index-js.png)

### [Candidates can be created only by signing up: `public/html/candidates-index.html`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/40acb6f/public/html/candidates-index.html)
![Candidates can be created only by signing up, public/html/candidates-index.html](_DIFFSHOTS/candidates-can-be-created-only-by-signing-up.public-html-candidates-index-html.png)

### [Candidates can be created only by signing up: `public/html/candidates-show.html`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/40acb6f/public/html/candidates-show.html)
![Candidates can be created only by signing up, public/html/candidates-show.html](_DIFFSHOTS/candidates-can-be-created-only-by-signing-up.public-html-candidates-show-html.png)

### [Candidates can be created only by signing up: `public/js/app.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/40acb6f/public/js/app.js)
![Candidates can be created only by signing up, public/js/app.js](_DIFFSHOTS/candidates-can-be-created-only-by-signing-up.public-js-app-js.png)

# Candidates can delete and update themselves only

> [da868c8](https://www.github.com/ga-wdi-exercises/whenpresident/commit/da868c8)

<details>
  <summary>Why is `req.session.destroy()` necessary here?</summary>
  <blockquote>Without it Express will think the deleted user is still logged in.</blockquote>
</details>

<details>
  <summary>What does `target="_top"` in an `<a>` do? (What happens if you don't have it?)</summary>
  <blockquote>In Angular apps, clicking on links doesn't reload the page. `target="_top"` forces the page to reload.</blockquote>
</details>

### [Candidates can delete and update themselves only: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/da868c8/index.js)
![Candidates can delete and update themselves only, index.js](_DIFFSHOTS/candidates-can-delete-and-update-themselves-only.index-js.png)

### [Candidates can delete and update themselves only: `public/html/candidates-show.html`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/da868c8/public/html/candidates-show.html)
![Candidates can delete and update themselves only, public/html/candidates-show.html](_DIFFSHOTS/candidates-can-delete-and-update-themselves-only.public-html-candidates-show-html.png)

### [Candidates can delete and update themselves only: `public/js/app.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/da868c8/public/js/app.js)
![Candidates can delete and update themselves only, public/js/app.js](_DIFFSHOTS/candidates-can-delete-and-update-themselves-only.public-js-app-js.png)

# Delete and update forms show up only for current user

> [b0cc736](https://www.github.com/ga-wdi-exercises/whenpresident/commit/b0cc736)

### [Delete and update forms show up only for current user: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/b0cc736/index.js)
![Delete and update forms show up only for current user, index.js](_DIFFSHOTS/delete-and-update-forms-show-up-only-for-current-user.index-js.png)

### [Delete and update forms show up only for current user: `public/js/app.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/b0cc736/public/js/app.js)
![Delete and update forms show up only for current user, public/js/app.js](_DIFFSHOTS/delete-and-update-forms-show-up-only-for-current-user.public-js-app-js.png)

### [Delete and update forms show up only for current user: `public/html/candidates-show.html`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/b0cc736/public/html/candidates-show.html)
![Delete and update forms show up only for current user, public/html/candidates-show.html](_DIFFSHOTS/delete-and-update-forms-show-up-only-for-current-user.public-html-candidates-show-html.png)

-----
# STOP
-----

# Looks for env.json only in development

> [982cff4](https://www.github.com/ga-wdi-exercises/whenpresident/commit/982cff4)

### [Looks for env.json only in development: `index.js`](https://www.github.com/ga-wdi-exercises/whenpresident/blob/982cff4/index.js)
![Looks for env.json only in development, index.js](_DIFFSHOTS/looks-for-envjson-only-in-development.index-js.png)

# Deploy!

<details>
  <summary>What will you need to change your `t_callback_url` to in order for this to work?</summary>
  <blockquote>Something like https://everlasting-glade-123456.herokuapp.com/login/twitter/callback</blockquote>
</details>

<details>
  <summary>You don't have your `env.json` on Heroku. How else can you set environment variables on Heroku?</summary>
  <pre>
$ heroku config:set MONGOLAB_URL="mongodb://test:testerson@ds123456.mlab.com:12345/some_database"
$ heroku config:set session_secret="some random string"
$ heroku config:set t_callback_url="https://everlasting-glade-123456.herokuapp.com/login/twitter/callback"
$ heroku config:set t_consumer_key="abc1234"
$ heroku config:set t_consumer_secret="abcdef123456"  
  </pre>
</details>
