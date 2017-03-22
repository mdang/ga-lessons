# Ajax

### Learning Objectives

- Describe APIs and identify common use cases.
- Describe AJAX and list the advantages and disadvantages of using AJAX.
- Implement an AJAX request to fetch data from an API.
- Demonstrate the ability to read API documentation.


## Why we want to use API's

- Show examples of sites (Amazon autocomplete, Trello, GitHub registering)

## Ajax

### Advantages 
- faster
- separate front-end vs back-end

### Disadvantages
- js disabled
- back button disabled
- ui considerations

## How Web Requests Work
- Chrome network tab
- Diagram of web requests 
- Client/Server model

## JSON

## AJAX with jQuery

## Reading Documentation
- Giphy API 

## We Do 
- Giphy API 



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
