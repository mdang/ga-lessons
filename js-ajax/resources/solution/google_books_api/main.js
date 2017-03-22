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