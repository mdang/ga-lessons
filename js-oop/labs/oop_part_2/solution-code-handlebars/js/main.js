// grab node you want to append template to
var $optionsContainer = $('#options-display');

// define car options to be used for template
var vehicleOptions = [
  {choice:'cadenza', price: 35000},
  {choice:'forte', price: 20000},
  {choice:'optima', price: 29050},
  {choice:'sedona', price: 38650},
  {choice:'soul', price: 42200}
];

// define color options to be used for template
var colorOptions = [
  {choice:'black', price: 50},
  {choice:'white', price: 100},
  {choice:'silver', price: 250}
];

// define car package option
var packageOptions = [
  {choice:'Rear Camera', price: 150},
  {choice:'LED Positioning Light', price: 150},
  {choice:'Rear Camera and LED Positioning Light', price: 200},
];

var carSelection = {
  vehicle: {choice: 'Not Selected', price: 0},
  color: {choice: 'Not Selected', price: 0},
  package: {choice: 'Not Selected', price: 0}
};

// add click event to li nodes that will handle style changes
// and dynamically render DOM specific to option selected
$('li').on('click', function() {

  // remove active styling from all lis then add active styling to clicked li
  $('li').removeClass('active');
  $(this).addClass('active');

  // Find out which tab was clicked
  var tabOption = $(this).data('tab');

  // Empty out the container that will display the options
  $optionsContainer.empty();

  displayPanelContent(tabOption);

});


function displayPanelContent (contentType) {
  var source = $('#' + contentType + '-options-template').html();
  var template = Handlebars.compile(source);

  switch(contentType) {
    case 'vehicle':
      renderOptions(vehicleOptions, template, contentType);
      break;
    case 'color':
      renderOptions(colorOptions, template, contentType);
      break;
    case 'package':
      renderOptions(packageOptions, template, contentType);
      break;
    case 'summary':
      renderOptions(carSelection, template, contentType);
      break;
  }
}

function renderOptions(options, template, contentType) {

  if (contentType === 'summary') {
    var html = template(options);
    $optionsContainer.append(html);

  } else {
    for (var i = 0; i < options.length; i++) {

      var html = template(options[i]);

      $optionsContainer.append(html);
    }
  }

}

$('.options-container').on('click', 'div[class*="option"]', function () {
  var panel = $(this).data('panel');

  carSelection[panel].choice = $(this).data('option');
  carSelection[panel].price = $(this).data('price');

  if (carSelection.color.choice !== 'Not Selected' && carSelection.vehicle.choice !== 'Not Selected') {
    $('.vehicle-display').attr('src', 'assets/' + carSelection.vehicle.choice + '-' + carSelection.color.choice + '.jpg');
  } else if (carSelection.vehicle.choice !== 'Not Selected') {
    $('.vehicle-display').attr('src', 'assets/' + carSelection.vehicle.choice + '.jpg');
  }

  updateCost();
});


function updateCost () {
  var cost = carSelection.color.price + carSelection.vehicle.price + carSelection.package.price;

  cost = moneyFormat(cost);

  $('.cost-display').text('$' + cost);
}

function moneyFormat(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}


displayPanelContent('vehicle');