// Here is the url you will be using for your AJAX request:
// url: 'http://jsonplaceholder.typicode.com/photos/1'



$.ajax({
  url: 'http://jsonplaceholder.typicode.com/photos/1',
  method: 'GET',
  success: function (response) {
    console.log(response);
    $('img').attr('src', response.thumbnailUrl);
    $('h1').text(response.title);
  }
})


// Write an AJAX request (including a url, method, and success function with response as the parameter)

// Within the success function:
  // Write a console.log statement to see the response console.log(response)
  // Use jQuery to update the H1 to the title that was sent in the response
  // Use jQuery to update the src value of the image using the .attr() method
    