# OpenWeatherMaps API

## Instructions
1. Take a look at the openweathermaps API documentation: http://openweathermap.org/current
2. Get an API key from Open Weather Maps: http://openweathermap.org/appid#get
3. Add an event for the form submit in your main.js file. (Don't forget to prevent the default action for forms so that the page won't refresh)
4. When the form is submitted:
	- Get the value the user entered into the `#city` field and store it in a variable `key`
	- Use the `ajax()` method to write a request using the following settings:
		- **url:** See hint below to find out how the URL should be formatted or look at the documentation.
		- **method:** Which method will we use to get data?
		- **success:** A function that will run when the api call is successful. From within the success function, update the text for `#temp` to display the temperature in this format: "The weather in {city} is {75} degrees."
5. **Bonus:** Add a function that will run if there is an error with the request. Display an error message if this is the case.




## Hints
Here's what a sample url will look like:

```js
'http://api.openweathermap.org/data/2.5/weather?q=Chicago&units=imperial&appid=02e84210a52ed716535f02989864d080'
```
Following this format:

```js
'http://api.openweathermap.org/data/2.5/weather?q=City&units=imperial&appid=yourAppKey'
```

var weatherUrl = "http://api.openweathermap.org/data/2.5/weather?q=";


// Get an api key: http://openweathermap.org/appid#get
var key = 'Your key here';

