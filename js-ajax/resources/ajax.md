## AJAX

> This lesson was adapted by the AJAX lesson in WDI resources by Micah Rich

Learning Objectives

* Explain what AJAX is and what problem it solves
* Explain the difference between an AJAX request and a synchronous request.
* Explain what $.ajax is, and how it relates to methods such as $.get and $.getJSON.
* Describe how the native XMLHttpRequest differs from the jQuery AJAX implementation
* Use jQuery $.ajax to make an asynchronous GET request.
* Use jQuery $.ajax to make an asynchronous POST request.
* Render HTML content using data loaded from an AJAX request.
* Wrap a call to a third-party service into a JSONP callback
* Explain the need for CORS and how it enables secure requests to be made across domains

## What is AJAX? 

AJAX (Asynchronous JavaScript and XML) is a method of building interactive applications for the Web that processes user requests immediately, without re-rendering a whole page.

> **Example:** A weather forecasting site could display local conditions on one side of the page as soon as a user finishes typing in a zip code. The temperature could refresh every minute, without the user having to hit a refresh button.

In general the process looks like this – use JavaScript on the client side to hit an API (without reloading a page), then use the pure data you get back to manipulate the DOM somehow if you need to. This DOM manipulation can take the form of rendering a template or just changing a number on the page.

###Async vs Sync

[Explanation]

###History

**From Wikipedia:**

In 1998, Microsoft Outlook Web App team implemented the first component XMLHTTP by client script.

In 1999, Microsoft used its iframe technology to dynamically update the news stories and stock quotes on the default page for Internet Explorer, and created the XMLHTTP ActiveX control in Internet Explorer 5, which was later adopted by Mozilla, Safari, Opera and other browsers as the XMLHttpRequest JavaScript object.

Google made a wide deployment of standards-compliant, cross browser Ajax with Gmail (2004) and Google Maps (2005). In October 2004 Kayak.com's public beta release was among the first large-scale e-commerce uses of what their developers at that time called "the xml http thing".

The term "Ajax" was publicly stated on 18 February 2005 by Jesse James Garrett in an article titled "Ajax: A New Approach to Web Applications", based on techniques used on Google pages

Source: https://en.wikipedia.org/wiki/Ajax_(programming)

### SPA Lifecycle

![single page applications](https://cloud.githubusercontent.com/assets/25366/8970635/896c4cce-35ff-11e5-96b2-ef7e62784764.png)

#### JSON

JSON (JavaScript Object Notation) is a minimal, readable format for structuring data. It is used primarily to transmit data between a server and web application, as an alternative to XML

###Advantages

- __Faster__ - This is the most obvious reason for using to AJAX on your front-end: AJAX allows easier and quicker interaction between user and website as pages are not reloaded for content to be displayed.  The server doesn't have to get data, render HTML, and then spit it out, it just has to get data and your already-loaded front-end does the rest.

- __Compact__ - With AJAX, several application features can be handled using a single web page. That means we modularize our app into smaller bits, and it becomes easier to work on.

- __Backend Separated from Front-end__ - Applications that use AJAX-heavy front-ends means developers don't have to work on both sides of the stack at the same time. Some developers can be dedicated to building an API that just serves data, and others can focus on consuming that data and building interfaces.


###Disadvantages

- __The back and refresh button are rendered useless__ - Since things are loaded dynamically on a page, without that page reloading (or more importantly a URL being changed), clicking the back or refresh button don't work the way you're used to. That's actually a pretty big deal – UX designers are very familiar with the fact that users are _accustomed_ to being able to hit back when they need to. Some advanced front-end frameworks have tried to solve this issue with clever workarounds, but that's not always the case and not always accurate.

- __JavaScript can be disabled__ - While javascript is secure and has been heavily used by websites for a long period of time, a percentage of website surfers prefer to turn javascript functionality off on their browser, rendering the AJAX application totally useless. That's not always the best thing to design for, and more often than not, you'll find yourself assuming users have JS on, but it's important to know your whole site could be useless in some situations.

- __You have to consider the UX even more__ - While UX is crucial for _any_ application, the fact that a page doesn't refresh means you have to be even more considerate of what a user is experiencing. If something in your JavaScript goes wrong, your AJAX breaks, and you don't have failsafes thoughtfully built in, your user might be clicking a button and seeing absolutely nothing happen. Most common users won't have their consoles open to notice any errors.

## Ajax with jQuery

### $.get

```js
// Simple request to get and print response to console
$.get( "example.php", function(data) {
  console.log( data );
});
```

```js
// Make request but also send parameters
$.get('test.php', { name: "John", time: "2pm" } )
  .done(function( data ) {
    console.log( "Data Loaded: " + data );
  });
```

```js
// Assign handlers immediately after making the request,
// and remember the jqxhr object for this request
$.get('example.php', function(data) {
  console.log('success');
})
  .done(function(data) {
    console.log('second success');
  })
  .fail(function(jqXHR, textStatus, errorThrown) {
    console.log('error');
  })
  .always(function() {
    console.log('finished');
  });
```

```js
var request = $.ajax({
  url: 'content.html'
});

request.done(function(data, textStatus, jqXHR) {
  console.log('done', data);
});

request.fail(function(jqXHR, textStatus, errorThrown) {
  console.log(textStatus, errorThrown);
});

request.always(function(data, textStatus, errorThrown) {
  console.log('i always run no matter what');
});
```

Source: https://api.jquery.com/jquery.get/

### $.ajax

```js
// Make a read request to a server
$.ajax({
  url: 'search.php',
  data: { q: 'houses', location: 'Austin' }
})
  .done(function( data ) {
    alert( 'Data received: ', data );
  });
```

```js
// Post data to the server
$.ajax({
  method: 'POST',
  url: 'some.php',
  data: { name: 'John', location: 'Boston' }
})
  .done(function( data ) {
    alert( 'Data saved: ', data );
  })
  .fail(function(jqXHR, textStatus, errorThrown) {
    console.log( "error" );
  })
  .always(function() {
    console.log( "finished" );
  });
```

Source: http://api.jquery.com/jquery.ajax/

**IMPORTANT NOTE**

If in this cohort you are doing Ajax before backend, you need to run a static file server or you will get Same Origin Policy errors 

```bash
python -m SimpleHTTPServer 3000
```

> https://github.com/ga-students/wdi-atx-7-class/tree/master/w03/d02/morning/student Go over getting api.md from your own site, and then go over the Search api example with them. Students will be doing the last two on their own. 

## Class Exercise 

**20 min**

Giphy API 

[Finish the last two commented out API endpoints from class example]

<hr>

## Same-Origin Policy

Reference: https://jvaneyck.wordpress.com/2014/01/07/cross-domain-requests-in-javascript/

```console
XMLHttpRequest cannot load http://external.service/. No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://my.app' is therefore not allowed access.
```

Same-Origin Policy (SOP) is a security measure implemented in browsers to restrict interaction between documents (or scripts) that have different origins. The origin of a page is defined by its  protocol, host and port number. 

The SOP prevents a malicious script from reading data of your domain and sending it to their servers. This means that some script kiddie will not be able to steal your cookies that easily.

**Solutions:** 

* JSONP
* Server Side Proxy
* CORS

### JSONP

JavaScript Object Notation with Padding (JSONP in short) is a way of performing cross-domain requests by exploiting the fact that script tags in HTML pages can load code coming from a different origin.

* JSONP can only be used to perform Cross-Domain GET requests. If you want to use another HTTP verb (like POST, PUT or DELETE), you cannot use the JSONP approach.
* The server must explicitly support JSONP requests

```js
$.ajax({
  type: 'GET',
  url: 'http://www.test.com/api',
  jsonpCallback: 'callback',
  dataType: 'jsonp',
  success: function(json) {
    console.dir(json.sites);
  },
  error: function(e) {
    console.log(e.message);
  }
});
```

### Server Side Proxy

Servers don't have the same limitations as browsers do when it comes to where they're allowed to request data. Create your own API endpoint that makes a request on your behalf to the third party. Then take the results and pass them back to your client side JavaScript. The browser allows the request to go through because it's from the same domain.  

### CORS

* Older versions of Internet Explorer only partially support CORS
* For all but the simplest requests you have to double the amount of HTTP requests (preflighting CORS requests)
* Some firewalls strip these CORS HTTP headers by default

[Adding support for CORS in Express](http://enable-cors.org/server_expressjs.html)

## Class Exercise

**20 min**

OMDB API with JSONP 

<hr>
