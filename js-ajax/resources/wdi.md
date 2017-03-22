# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) AJAX & APIs (90 mins)


| Timing | Type | Topic |
| --- | --- | --- |
| 5 min | [Opening](#opening) | Q&A |
| 10 min | [Intro to New Material](#intro-to-apis) | Intro to APIs |
| 10 min | [Intro to New Material](#intro-to-ajax) | Intro to AJAX |
| 10 min | [Intro to New Material](#making-ajax-requests) | Making Ajax Requests |
| 15 min | [Guided Practice](#making-api-call) | Making an API Call |
| 10 min | [Independent Practice](#ind-practice) | Making an API Call |
| 10 min | [Guided Practice](#reading-documentation) | Reading Documentation |
| 10 min | [Independent Practice](#open-weather-maps) | OpenWeatherMaps API |
| _if time permits_ | [Intro to New Material](#network-tab) | HTTP and Chrome's Network Tab |
| 5 min | [Conclusion](#conclusion) |Q&A |

### LEARNING OBJECTIVES
*After this lesson, you will be able to:*

- Describe APIs and identify common use cases.
- Describe AJAX and list the advantages and disadvantages of using AJAX.
- Implement an AJAX request to fetch data from an API.
- Demonstrate the ability to read API documentation.


### STUDENT PRE-WORK
*Before this lesson, you should already be able to:*

- Use CSS selectors with the jQuery or `$` method to select elements in the DOM.
- Use selectors and jQuery methods to:
	- Add and remove classes on DOM elements.
	- Get and set information inside DOM elements.
	- Change the value of attributes on DOM elements.
- Write jQuery code to detect and react to a submit event.

### INSTRUCTOR PREP
*Before this lesson, instructors will need to:*

- Have students open entire starter\_code folder in Sublime/Atom

---
<a name="opening"></a>
## Opening (5 mins)
- Review Learning Objectives
- Preview the lab students will be working on in this class.

In this lesson we'll be digging into how we can request data from an external API using AJAX.

What is an API and why are they useful? Watch this short [video](https://generalassembly.wistia.com/medias/ntnzqxrij7) to find out.


***

<a name="intro-to-apis"></a>
## Intro to APIs (10 mins)

Taken from HowStuffWorks.com:

"An application-programming interface (API) is a set of programming instructions and standards for accessing a Web-based software application or Web tool. A software company releases its API to the public so that other software developers can design products that are powered by its service...[it] is a software-to-software interface, not a user interface. With APIs, applications talk to each other without any user knowledge or intervention."

As you saw in the video, Application Programming Interfaces (APIs) can be used to communicate between programs.

#### When do we want to use an API?

So, when do we want to use an API?

Let's explore a few examples where it would be useful to pull data from an external API.

##### Maps

We may want to incorporate an interactive map into our website, but it would take a lot of time and manpower to do it ourselves.

Instead, we can use the Google Maps API to integrate the functionality of Google Maps into our site.


Even large companies like WhatsApp and Airbnb use the Google Maps API.


![](http://circuits-assets.generalassemb.ly/prod/asset/4976/sjC5K4ZzwF0AAAAASUVORK5CYII_.png)


Why bother recreating a map from scratch when we can use a platform that contains a variety of features and is maintained by a team of expert developers?

##### Social Media Integration

If we want to integrate social media sharing into our site, we can use the Twitter or Facebook APIs. This allows our users to log in with their existing accounts and saves us from having to create our own social media platform.

##### Payment System

If we want to integrate a secure payment system into our site, we can make use of a payment API, such as PayPal.


![](http://circuits-assets.generalassemb.ly/prod/asset/4979/0OsH4CBAgQIECAAAECBAgQIECAAAECBAhUKCB0rhDTUAQIECBAgAABAgQIECBAgAABAgQIEKi7gNC57neA9RMgQIAAAQIECBAgQIAAAQIECBAgQKBCAaFzhZiGIkCAAAECBAgQIECAAAECBAgQIECAQN0FhM51vwOsnwABAgQIECBAgAABAgQIECBAgAABAhUKCJ0rxDQUAQIECBAgQIAAAQIECBAgQIAAAQIE6i4gdK77HWD9BAgQIECA.png)


This allows our customers to make payments using the trusted accounts they've already set up.



#### What can an API do?

The first thing we need to find out when looking at an API is _what_ the API can do.

Every API can be used to complete different tasks. When we want to solve a particular problem, we need to research what different APIs can do so that we pick the right tool for the job.


- The Facebook and Twitter APIs allow us to access and update profiles and create status updates.
- The Spotify API allows us to find another user's playlists or create, add tracks to, and remove tracks from a playlist of our own.


How do we find out what an API can do?

Easy — we check out its documentation.


#### Turn and Talk

Spend two minutes discussing the following with a partner:

Describe APIs. List a few examples where it would be helpful to use an external API.

> Instructor Note: Whiteboard student ideas.

***

<a name="intro-to-ajax"></a>
## Intro to AJAX (10 mins)

We'll take a look at some examples of how we can make API calls and process the responses later in this lesson.

Before we start using these APIs, let's take a step back and look at AJAX: a group of technologies we can use to load data into different parts of our page.

#### What is AJAX?

So, what is AJAX?

AJAX stands for **A**synchronous **Ja**vaScript and **X**ML.

**Asynchronous** is a term used to describe a non-blocking process. This means that, when we're making updates, we can load data into part of a page without having the whole page refresh.

AJAX is used all over the web. You've probably encountered it before, even if you weren't aware of it.

- For example, think of a live search that loads results as you type. With AJAX, the whole page doesn't refresh every time you type a character — only the results are updated.

	![](http://circuits-assets.generalassemb.ly/prod/asset/5361/jsc-U8L1-amazon-cart.gif)

- Or, if you type a username into a web form, you may see a notification that the username has already been taken.

	![](http://circuits-assets.generalassemb.ly/prod/asset/5362/jsc_U8L1_ajax-login.gif)

#### How does AJAX work?
So how does AJAX work?

1. First, the browser requests data from a server.
2. The server then responds with data, often in HTML or JSON format.
3. When the server has finished responding, the browser will fire an event. This event triggers a function that processes the data and adds it to the page.

This allows us to change the parts of the page that need to be updated — without affecting the entire page.


#### Advantages

- __Faster__ - This is the most obvious reason for using to AJAX on your front-end: AJAX allows easier and quicker interaction between user and website as pages are not reloaded for content to be displayed.  The server doesn't have to get data, render HTML, and then spit it out, it just has to get data and your already-loaded front-end does the rest.

- __Compact__ - With AJAX, several application features can be handled using a single web page. That means we modularize our app into smaller bits, and it becomes easier to work on.

- __Backend Separated from Front-end__ - Applications that use AJAX-heavy front-ends means developers don't have to work on both sides of the stack at the same time. Some developers can be dedicated to building an API that just serves data, and others can focus on consuming that data and building interfaces.


#### Disadvantages

- __The back and refresh button are rendered useless__ - Since things are loaded dynamically on a page, without that page reloading (or more importantly a URL being changed), clicking the back or refresh button don't work the way you're used to. That's actually a pretty big deal – UX designers are very familiar with the fact that users are _accustomed_ to being able to hit back when they need to. Some advanced front-end frameworks have tried to solve this issue with clever workarounds, but that's not always the case and not always accurate.

- __Javascript can be disabled__ - While javascript is secure and has been heavily used by websites for a long period of time, a percentage of website surfers prefer to turn javascript functionality off on their browser, rendering the AJAX application totally useless. That's not always the best thing to design for, and more often than not, you'll find yourself assuming users have JS on, but it's important to know your whole site could be useless in some situations.

- __You have to consider the UX even more__ - While UX is crucial for _any_ application, the fact that a page doesn't refresh means you have to be even more considerate of what a user is experiencing. If something in your JavaScript goes wrong, your AJAX breaks, and you don't have failsafes thoughtfully built in, your user might be clicking a button and seeing absolutely nothing happen. Most common users won't have their consoles open to notice any errors.


<a name="making-ajax-requests"></a>
## Making AJAX Requests (10 mins)

Next, let's dig into the `ajax()` method, which we can use to request and send data. This method provides us with granular control by giving us more than 30 settings for managing our request.

Let's take a look at the syntax for the AJAX method:

```js
	$.ajax({ });
```

Then, we'll use object literal notation to pass in a settings object as the argument.


Here are some of the settings we can provide:

![](http://circuits-assets.generalassemb.ly/prod/asset/4992/08-39-settings_list.svg)

We can provide them in any order, as long as we are using valid object literal notation.


- **type** This will take the value "GET" if we want to request data from a server and "POST" if we want to send data that updates on a server.

  ```js
  $.ajax({
    	type: "GET"
  });
  ```
- **url** The URL setting defines the page where we'll send the request.
  ```js
  $.ajax({
	    type: "GET",
	    url: "http://www.omdbapi.com/?"
  });
  ```

- **data** Next, we have the data setting, which allows you to send additional data to the server along with the request.

  ```js
  $.ajax({
    	type: "GET",
    	url: "http://www.omdbapi.com/?",
    	data: {
          id: 123
      }
  });
  ```

- **success** Next up we have the success setting, which runs if the request is successfully completed.
  ```js
  $.ajax({
    type: "GET",
    url: "http://api.openweathermap.org/data/2.5/weather?q=",
    data: {
      id: 123
  },
    success: function( response ) {
      $('#temp').html("The temperature in Detroit is " + response.temp);
    }
  });
  ```

- **error** The error setting will run a function if there is an error with the request.

	```js
	$.ajax({
		type: "GET",
		url: "http://api.openweathermap.org/data/2.5/weather?q=",
		data: {
		  	id: 123
		},
		success: function( response ) {
		  	$('#temp').html("The temperature in Detroit is " + response.temp);
		},
		error: function() {
		  	alert("There was an error getting weather data.");
		}
	});
	```

- **beforeSend** We can use the beforeSend setting to run code before the request is sent.

  ```js
	$.ajax({
		type: 'GET',
		url: 'http://api.openweathermap.org/data/2.5/weather?q=',
		data: {
		  id: 123
		},
		success: function( response ) {
		  $('#temp').html('The temperature in Detroit is ' + response.temp);
		},
		error: function() {
		  alert('There was an error getting weather data.');
		},
		beforeSend: function () {
		  $('#page').append('Loading');
		}
	});
  ```

- **complete** And finally, we can use the complete setting to run a function after the request is complete.

  ```js
  $.ajax({
	    type: 'GET',
	    url: 'http://api.openweathermap.org/data/2.5/weather?q=',
	    data: {
	      id: 123
	    },
	    success: function( response ) {
	      $('#temp').html('The temperature in Detroit is ' + response.temp);
	    },
	    error: function() {
	      alert('There was an error getting weather data.');
	    },
	    beforeSend: function () {
	      $('#page').append('Loading');
	    },
	    complete: function () {
	      $('#loading').remove();
	    }
  });
  ```

***
<a name="making-api-call"></a>
## Guided Practice - Making an API Call (15 mins)

For our first API call, we'll be using the Google Books API.

Starter code for this exercise can be found in [starter\_code/google\_books\_api](starter_code/google_books_api).

We'll be creating a basic site where users can add books to a reading list by entering their International Standard Book Number (ISBN).

Let's start with a simple HTML form where a user can enter an ISBN, as well as an unordered list where we will add each book the user searches for:

```html
<h1>Search for a book by ISBN</h1>

<form>
	<input type="text" id="isbn" name="isbn" value="" placeholder="Please enter an ISBN">
	<button type="submit">Find Book</button>
</form>

<ul class="books">
</ul>

```

#### URLs

Before taking a look at the JavaScript, let's take a step back and find out how we can access the data for a book using the Google Books API.

To access this information, we'll need a URL where we can find the JSON data for a book that matches an ISBN number.

How does the server know what the request is asking? This is the job of the URL, a special path that specifies where a resource can be found on the web.

Let's take a look at the different components of a URL that could be used for an API call:

- **The Protocol:** HTTP — or **H**yper**t**ext **T**ransfer **P**rotocol — is a system of rules ("protocol") that determines how web pages ("hypertext") get sent ("transfer") from one place to another.

	This is really just a fancy way of saying "the rules of sending something from one place to another".

	![](http://circuits-assets.generalassemb.ly/prod/asset/5001/08-52-protocol.svg)

- **The Host:** This is the domain name for the site. This request will be sent to a Domain Name Server (DNS), which will look up the IP address and find out where the files for that resource are stored. An IP address is a unique string of numbers that helps us locate the correct server.

	![](http://circuits-assets.generalassemb.ly/prod/asset/5002/08-53-host.svg)


- **The Port:** Internet hosts have a certain number of ports that offer different services. One port could offer HTTP, another could offer mail routing, and so on. HTTP usually runs on port 80 and HTTPS runs on port 443, but this is not always the case. If the protocol is running on the default port (80 or 443), you don't need to specify a port number. If it is running on a different port, a colon (:) followed by the port number (in this case 1234) is required to point to that port.


	![](http://circuits-assets.generalassemb.ly/prod/asset/5003/08-54-port.svg)

- **The Resource Path:** Where the resource (HTML, JSON, PDF, Images, etc.) is located.

	![](http://circuits-assets.generalassemb.ly/prod/asset/5004/08-55-path.svg)

- **The Query:** We can use queries to "filter" the data we find and retrieve certain results.

	![](http://circuits-assets.generalassemb.ly/prod/asset/5005/08-56-query.svg)

<!--
ID NEEDED: It would be great to add this video here:
https://circuits.generalassemb.ly/student/256/slideshows/685#/1

-->

#### Google Books URL

Now, let's break down what the URL that allows us to access information from Google Books looks like:

![](http://circuits-assets.generalassemb.ly/prod/asset/5006/08-57-google.svg)



- **The Protocol:** In this case, it will be HTTPS, which is the protocol used for a secure communication over a network.
	![](http://circuits-assets.generalassemb.ly/prod/asset/5007/08-58-protocol.svg)

- **The Host:** Google APIs will be the host at [www.googleapis.com](http://www.googleapis.com).
	![](http://circuits-assets.generalassemb.ly/prod/asset/5008/08-59-host.svg)

- **The Resource Path:** We want to access Version 1 of the books API and find a volume.
	![](http://circuits-assets.generalassemb.ly/prod/asset/5009/08-60-resource.svg)

- **The Query:** This is how we will look up a particular book.
	![](http://circuits-assets.generalassemb.ly/prod/asset/5010/08-61-query.svg)


_This URL will mostly stay the same for each call; only the ISBN at the end will vary:_

![](http://circuits-assets.generalassemb.ly/prod/asset/5011/08-62-usbn.svg)

####  Constructing the URL

We can use string concatenation to add the ISBN a user enters to the URL and then locate information about that book:

`https://www.googleapis.com/books/v1/volumes?q=isbn:" + isbnUserEntered`

> Paste the below URL into your browser and take a look at the JSON object that is returned.

`https://www.googleapis.com/books/v1/volumes?q=isbn:0679775439`

Now that you've seen the full JSON response, let's take a look at a stripped-down version of the response showing us the relevant data.

You can see that we have an array named "items." This array contains a JSON object.


```js
{
 "items": [
  {
   "volumeInfo": {
    "title": "The Wind-up Bird Chronicle",
    "description": "Superimposes the collapse of a marriage over the investigation into recovered war memories and a man's search for his own identity",
    "imageLinks": {
     "thumbnail": "http://books.google.com/books/content?id=iTt3WN2U8wwC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api"
    },
    "previewLink": "http://books.google.com/books?id=iTt3WN2U8wwC&printsec=frontcover&dq=isbn:0679775439&hl=&cd=1&source=gbs_api"
    }
  }
 ]
}
```

Within that object, there is an object named `"volumeInfo"` that contains information we want to access about the book: a title, description, thumbnail, and preview link.

To access the title in this array, we can use the following syntax:

`response.items[0].volumeInfo.title`

***
<a name="ind-practice"></a>
## Independent Practice - Making an API Call (10 mins)

Alright! Now that we know more about the URL we'll use to make the API call and the data we'll receive from it, let's dig into the JavaScript.

- Paste the following code in your JS file.
- Get with a group of 3 - 4 and walk through each line of code. Talk about what each line will do.
- Open the site in Chrome and test it out, entering different ISBN numbers into the input field.
	- Try out the following ISBN numbers:
		- 9781439154175
		- 9780307477477
		- 9781596792357
		- 0679775439
- Take a look at your console. We are using a `console.log` statement to log the response that was received from the server. Enter an ISBN, hit the submit button, and take a look at the full response that was returned.

```js

var googleBooksUrl = "https://www.googleapis.com/books/v1/volumes?q=isbn:";

$('form').on('submit', function(e) {
  e.preventDefault();

  var isbn = $('#isbn').val();

  $.ajax({
      type: 'GET',
      url: googleBooksUrl + isbn,
      success: function( response ) {
        console.log(response);
        var bookInfo = response.items[0].volumeInfo;

        var listItemHTML = '<li>'
				listItemHTML += '<h2>' + bookInfo.title + '</h2>'
				listItemHTML += '<p>' + bookInfo.description + '</p>'
				listItemHTML += '<img src="' + bookInfo.imageLinks.thumbnail + '">'
				listItemHTML += '<a href="' + bookInfo.previewLink + '">Preview Book</a>'
				listItemHTML += '</li>'

        $('.books').append(listItemHTML);

      }
  });
});
```

> Note how constructing an HTML fragment for our list item and adding in the data that needs to be displayed using JavaScript gets a bit messy. We can use a templating library, like Handlebars, to make this process cleaner and keep HTML out of our JS files.

***
<a name="reading-documentation"></a>
## Reading Documentation (10 mins)

Now that we have some experience working with APIs, we're going to take a step back and learn how to fully understand an API's documentation.

There are no rules governing how to write documentation for an API, so its content is presented differently each time.

While searching for the right API, you'll want to explore the different options that are available to you and then take a look at each option's documentation.

Try to find documentation that contains detailed setup instructions and discusses the options to work with. Assets like these will come in handy when implementing your APIs.

Knowing how to quickly find key pieces of information is the most important part of reading API documentation.

In this lesson, we'll take a look at an API that has very clear documentation — [OpenWeatherMap](http://openweathermap.org/api) — and then practice looking through that documentation and making API calls.

#### Guided Practice

If you go to the [OpenWeatherMap](http://openweathermap.org/api) site and scroll down, you'll see a section that says "API Documentation."

![](http://circuits-assets.generalassemb.ly/prod/asset/5376/Screen_Shot_2016-07-17_at_6.13.07_PM.png)

#### API Keys


When we click on the "How to Start" link we are taken to a page that provides us with information on how to get an [API key](http://openweathermap.org/appid).

For security reasons, many APIs require the use of keys.

An API key is like a signature that uniquely identifies a user. This helps APIs keep track of their traffic and monitor any suspicious activity, such as an individual user sending too many requests.

For example, malicious users might try using multiple usernames until they find one that works. Keys can help prevent these kind of attacks by limiting how many requests one user can make.

OpenWeather's documentation makes it easy for us to obtain an API key. We simply click the "Sign Up" button and create an account and then you can get an [API key](http://openweathermap.org/appid).

To make an API call, we'll need to add our key to the URL:

```js
http://api.openweathermap.org/data/2.5/forecast/city?id=524901&APPID={APIKEY}
```


Here's an example provided in the documentation:

<span style="color: orange;">api.openweathermap.org/data/2.5/forecast/city?id=524901&APPID=<span style="background-color: yellow">1111111111</span></span>

As you can see, all we need to do is append our API key to the end of the URL.

Now, let's review the main points you should look for when looking through an API's documentation.

*   Do I need an API key?
*   What kind of information is available?
*   What does a request look like? What should the structure of the URL be?
*   What response should I expect to get back?

Once you've answered all of these questions, you're ready to request data.

#### Looking at Documentation

Now that we have our key, let's look back at some of the other information the API documentation can provide.

Get with a partner and spend a few minutes exploring the documentation. See what different types of data we can get from the API.

***
<a name="open-weather-maps"></a>
## Independent Practice - OpenWeatherMaps API (15 mins)

Work with a partner to get practice making an API call to OpenWeatherMaps.

Instructions can be found in [starter\_code/weather\_api](starter_code/weather_api/readme.md).

***
<a name="network-tab"></a>
## HTTP and Chrome's Network Tab (15 mins) (If time permits)

Now, let's dive into the underlying communication layer responsible for transporting our API calls — HTTP.

Having a good grasp on HTTP and the request-and-response cycle is crucial when we want to create, read, update, or delete data.

#### What is HTTP?

HTTP (HyperText Transfer Protocol) is a protocol (a system of rules) that determines how web pages ("HyperText") are sent ("transferred") from one place to another.

Among other things, it defines how messages passed between HTTP clients and HTTP servers should be formatted.


As we've seen in previous lessons, the web is a service that works through a combination of clients (which make requests) and servers (which receive requests).

![](http://circuits-assets.generalassemb.ly/prod/asset/5261/Slide-21-Client-Server-Model.svg)


Let's see how clients and servers handle the request- and- response process.

1.  A client sends an HTTP request to a HTTP server running on a remote machine. The hostname, given in the URL, indicates which server will receive the request.

	In the last lesson, we saw how the URL tells the server what the request is asking. Here's a refresher on the different elements that make up a URL:

	![](http://circuits-assets.generalassemb.ly/prod/asset/5073/08-28-url.svg)
3.  The HTTP server processes the HTTP request. This may entail passing the request to a web application written in a language such as Ruby, which creates an HTTP response.

1.  The response gets sent back to the client.

3.  The client processes the response.

#### The Network Tab

Next, let's explore some HTTP resources by looking at HTTP requests and responses using the Chrome Inspector.

To view this request- and- response cycle in Chrome, we'll open up Inspector (command + option + 'i', or ctrl + click and select 'Inspect Element') and select the "Network" tab.


In order to see the requests and responses that are sent out when the page first loads, we'll need to refresh the page:



![](http://circuits-assets.generalassemb.ly/prod/asset/5067/A7aFmZyTXfq7AAAAAElFTkSuQmCC.png)

You should be able to see a few HTTP requests and responses in the "Network" tab.

For each request you'll see Name, Method, Status, Type, and Size, along with information about how long it took to get each of these resources.

Most of this information comes from the HTTP request and response.

Some HTTP requests are for CSS, JavaScript, and images referenced by the HTML.


Let's go ahead and type a city and state into a simple form and hit "Get Weather," which will request the current weather data for that city from the OpenWeatherMaps API.

![](http://circuits-assets.generalassemb.ly/prod/asset/5068/5n5hXjlLZE0AAAAASUVORK5CYII_.png)


When we do this, we can see that the "Network" tab displays our API request:

![](http://circuits-assets.generalassemb.ly/prod/asset/5262/08-32-last_line.svg)


In order to inspect this request and its response, we'll click on the name in the far lefthand column and click on the "Headers" tab:


![](http://circuits-assets.generalassemb.ly/prod/asset/5264/08-33-headers.svg)


Headers are meta-data properties of an HTTP request or response, separate from the body of the message.


![](http://circuits-assets.generalassemb.ly/prod/asset/5264/08-33-headers.svg)

#### Request

We can find all kinds of information in the request header, which shows the request that was sent to the server:


```
GET /data/2.5/weather?q=San%20Francisco,CA&appid=02e84210a52ed716535f02989864d080 HTTP/1.1
Host: api.openweathermap.org
Connection: keep-alive
Pragma: no-cache
Cache-Control: no-cache
Accept: */*
Origin: null
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/51.0.2704.103 Safari/537.36
Accept-Encoding: gzip, deflate, sdch
        Accept-Language: en-US,en;q=0.8
```

Here is the structure for the request:

`[http request method] [URL] [http version] [list of headers]`

#### HTTP Request Methods

The first word in the request line, "GET," is the HTTP request's method.

In the last lesson we looked at the "GET" method, which is used to retrieve data, and the "POST" method, which is used to send or create data.

Here is a full list of the HTTP request methods available to us:

*   **GET**: Retrieve a resource.
*   **POST**: Create a resource.
*   **PATCH** (_or PUT, but PATCH is recommended_): Update an existing resource.
*   **DELETE**: Delete a resource.
*   **HEAD**: Retrieve the headers for a resource.

Of these, `"GET"` and `"POST"` are the most commonly used.

#### Response

When a client sends a request, the server sends back a response. Let's take a look at the response headers that were returned:

```
HTTP/1.1 200 OK
Server: openresty
Date: Mon, 18 Jul 2016 07:25:56 GMT
Content-Type: application/json; charset=utf-8
Content-Length: 431
Connection: keep-alive
X-Cache-Key: /data/2.5/weather?q=san%20francisco,ca
Access-Control-Allow-Origin: *
Access-Control-Allow-Credentials: true
        Access-Control-Allow-Methods: GET, POST
```


The standard format for this response is:

`[http version] [status] [reason]  
[list of headers]` `[response body]` `# typically HTML, JSON,` ...


- The HTTP version should be 1.1

- [Status Codes](http://en.wikipedia.org/wiki/List_of_HTTP_status_codes) have standard meanings; here are a few:

	<img src="http://circuits-assets.generalassemb.ly/prod/asset/5070/08-39-table.svg" width="300px">
- **Response Body:** If we click on the "Response" tab, this is what we'll see:

	![](http://circuits-assets.generalassemb.ly/prod/asset/5069/h8rcP8_2FgFogAAAABJRU5ErkJggg__.png)
	The response is a JSON object with the current weather data we requested from the OpenWeatherMaps API.

#### Review

The "Network" tab is a helpful resource if your request and responses aren't working correctly.

You can use it to debug, or to take a look at your response if you're not sure what format to expect.


You can also use it to look at the status code to make sure that it is 200, which means request was successful.

Any other status code will help you identify what the error might be.

For example, if you receive a 404, it means that your request was not found.


***

<a name="conclusion"></a>
## Conclusion (5 mins)
- What's the main use case of AJAX? Why would anyone use it?
- How can we request data from an API using jQuery?


***


### ADDITIONAL RESOURCES
- Exercises
	- [Spotify Me](exercises/spotify_me) (45 mins - Beginning / Intermediate)
	- [AJAX Photos](exercises/ajax_photos/js/main.js) (20 mins - Intermediate)
	- [Slidey McShowington](exercises/slidey_mcshowington) (45 mins - Intermediate / Advanced)
	- [Infinite Giphy](exercises/infinite_giphy) (45 mins - Intermediate / Advanced)
	- [Plannr Leaflet Exercise](exercises/plannr/readme.md) (1 hour - Advanced)
- Videos
	- [What is an API?](https://generalassembly.wistia.com/medias/9ro7lhntsp)
	- [APIs and AJAX in Action](https://generalassembly.wistia.com/medias/9mkhalwdn6)
	- [APIs and HTTP Requests](https://generalassembly.wistia.com/medias/ycu49i7gby)

- Readings
	- [jQuery AJAX Documentation](http://api.jquery.com/jquery.ajax/)
	- [`No 'Access-Control-Allow-Origin' header is present on the requested resource` – WTF?](https://jvaneyck.wordpress.com/2014/01/07/cross-domain-requests-in-javascript/)
	- [What is Cross Origin Resource Sharing (CORS)?](https://www.maxcdn.com/one/visual-glossary/cors/)
	- [Google Maps API Lesson](assets/google_maps.md)
