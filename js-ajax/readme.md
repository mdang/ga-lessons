# Ajax

### Learning Objectives

- Describe APIs and identify common use cases.
- Describe AJAX and list the advantages and disadvantages of using AJAX.
- Implement an AJAX request to fetch data from an API.
- Demonstrate the ability to read API documentation.

## How Web Requests Work

- Diagram of web requests 
- Client/server model
- Response codes
- Chrome network tab to see network requests and status codes

## Ajax

### Advantages 

- faster
- keep front-end vs back-end separate

### Disadvantages

- js disabled
- back button disabled
- search engine optimization, crawlers
- ui considerations

#### Show examples of sites 

- Amazon autocomplete
- Trello boards
- GitHub registering a duplicate username

***

## Turn and Talk

- With the person next to you, come up with 2 examples from your favorite websites you visit everyday that use AJAX

***

## Why we want to use API's

- Why would we as developers use them
- Why would companies develop them
- What to watch out for, considerations (e.g. LinkedIn, Twitter)

## JSON

Keys and strings must be enclosed in double quotes

Values can be: 

- string
- number
- (JSON) object
- array
- true
- false
- null

## AJAX with jQuery

## Reading Documentation

- Go over [Giphy API documentation](https://github.com/Giphy/GiphyAPI)

## We Do 

- Giphy API 
- Use `search` endpoint to access data
- Take data and output to the page with `text` or `html`

## Same Origin Policy 

- cors
- jsonp
- server side proxy

***

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
