// Take a look at the openweathermaps API documentation: http://openweathermap.org/current


// Here's what a sample url will look like:
// 'http://api.openweathermap.org/data/2.5/weather?q=Chicago&units=imperial&appid=02e84210a52ed716535f02989864d080'

// Following this format:
// 'http://api.openweathermap.org/data/2.5/weather?q=City&units=imperial&appid=yourAppKey'

var weatherUrl = "http://api.openweathermap.org/data/2.5/weather?q=";


// Get an api key: http://openweathermap.org/appid#get
var key = 'Your key here';


$('form').on('submit', function (e) {
	e.preventDefault();

	var city =  $('#city').val();

	$.ajax({
		url: weatherUrl + city + '&units=imperial&appid=02e84210a52ed716535f02989864d080',
		method: 'GET',
		success: function (response) {
			console.log(response.main.temp);
			$('#temp').html('The weather in ' + city + ' is ' + response.main.temp + ' degrees.');
		}
	});
});
