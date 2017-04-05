# Handrolled OAuth in Express

## Learning Objectives

- Identify the 3 different "legs" of OAuth
- Use an external API to provide user authentication on an app
- Explain the difference between a session variable and an environment variable

### Big keywords

- Request token
- Consumer key
- Consumer secret
- User token
- User secret
- Callback URL
- Querystring
- Authorize
- Authenticate

## Framing

### What is OAuth?

Most "Log in with X" buttons you see use OAuth. We'll be looking at "Log in with Twitter" today.

**OAuth is a set of standards; not software.** Developers have agreed that this set of standards is a good way to securely **authenticate** users.

In short: your app asks Twitter to log in your user, and if they're successful, Twitter sends your app a special "token" that's unique to that user.

You can stop there and use this as a way of logging people in and out.

You can also take this a step further as a way of letting users **authorize** your app to talk to Twitter's API on their behalf. Using that token, your app can get additional information about the user, make posts for them and so on.

- What's the difference between *authenticating* and *authorizing*?

### The OAuth process

There are several versions and types of OAuth. We'll be using "three-legged" OAuth.

![#](images/oauth.png)

## Registering your app with Twitter (15 min)

To use Twitter's OAuth, we need to register our application.  This lets twitter control access and let's us provide the callback endpoint that Twitter will use to speak to our app.

1. Start registration:
  - https://apps.twitter.com/
  - Click "Create New App"
- Fill in the information for your WhenPresident app:
  - **Name:** of your app (must be unique across apps registered on Twitter)
  - **Description:** of "your" app
  - **Website:** Use "http://example.com" as a fake website
  - **Callback URL:** "http://127.0.0.1:3001/login/twitter/callback"
  - "Name", "Description", and "Webpage" do not matter much, for an in-class exercise.  They are very important for a production app.
  - we will be creating the endpoint, in our app, for the Callback URL.
  - `127.0.0.1:3001` is an alias for `localhost:3001`. External APIs often don't like to work with `localhost`, but accept `127.0.0.1` just fine.
- Set Permissions to read-only
  - Click the **"Permissions"** tab, select "read only", and press "Update Settings".
- We will need the Keys for this app
  - Click on the **"Keys and Access Tokens"** tab
  - We will be using the **"Consumer Key"** and **"Consumer Secret"** soon.

## [Go to walkthrough.md](walkthrough.md)

## References

- [Passport](http://passportjs.org/), an NPM package for OAuth with over 300 APIs
  - [Our own Passport lesson plan](https://github.com/ga-wdi-lessons/express-passport)
- [OAuth Bible](http://oauthbible.com/)
- [Request Talking to Twitter](https://github.com/request/request#oauth-signing), from Request's own Github page
- [Twitter's OAuth Docs](https://dev.twitter.com/oauth/overview/introduction)
- [Coinbase's API](https://developers.coinbase.com/docs/wallet/coinbase-connect/integrating), on which Robin used to work
- Screencasts using Passport Oauth
  - [Part 1](https://www.youtube.com/watch?v=DtfKlypcD_8&index=82&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW)
  - [Part 2](https://www.youtube.com/watch?v=-wsS2oZh4rk&index=83&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW)
  - [Part 3](https://www.youtube.com/watch?v=GWuS9TShHHg&index=84&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW)
