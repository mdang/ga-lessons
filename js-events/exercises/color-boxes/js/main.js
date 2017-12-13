console.log('main.js loaded');

$(function() {
  // DOM has loaded
  var BOX_COUNT = 12;
  var $container = $('.container');
  var faceToUse = 'https://images-na.ssl-images-amazon.com/images/M/MV5BMTgwMzQ4ODYxMV5BMl5BanBnXkFtZTcwNDAwMTc2NQ@@._V1_UX214_CR0,0,214,317_AL_.jpg';

  function getRandomColor() {
    var colorClasses = ['blue', 'orange', 'green', 'red', 'yellow'];

    return colorClasses[Math.floor(Math.random() * colorClasses.length)];
  }

  for (var i=0; i<BOX_COUNT; i++) {
    var $box = $('<div>').addClass(`box ${getRandomColor()}`);
    var $innerBox = $('<div>').addClass('innerBox');
    var $img = $('<img>')
                  .attr('src', faceToUse)
                  .attr('alt', 'Owen Wilson')
                  .addClass('faceImg');

    $innerBox.append($img);

    $innerBox.on('click', function() {
      $(this).removeClass().addClass(`innerBox ${getRandomColor()}`);
    });

    $innerBox.on('dblclick', function() {
      $(this).fadeOut('slow', function() {
        // The animation is complete
      });
    });

    $box.append($innerBox);
    $container.append($box);
  }

});
