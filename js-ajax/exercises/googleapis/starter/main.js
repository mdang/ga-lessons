console.log('main.js loaded');

var googleBooksUrl = "https://www.googleapis.com/books/v1/volumes?q=isbn:";

$(document).ready(function() {
  $('form').on('submit', function(e) {
    e.preventDefault();

    var isbn = $('#isbn').val();

    // Ajax code goes here
  });
});
