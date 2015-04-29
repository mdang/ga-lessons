## CSS Positioning

### "display" Property

##### display: none 

```HTML
<!DOCTYPE html>
<html>
<head>
<title>CSS Positioning</title>
<style type="text/css">

ul {
	display: none;
	/*visibility: hidden;*/
}

</style>
</head>
<body>
<ul>
	<li>Austin</li>
	<li>Dallas</li>
	<li>Houston</li>
	<li>Amarillo</li>
</ul>
<footer>&copy; 2015 General Assembly</footer>
</body>
</html>
```

**Note** Mention "visibility: hidden" property and how it's different

##### display: block

```HTML
<!DOCTYPE html>
<html>
<head>
<title>CSS Positioning</title>
<style type="text/css">

li {
	display: block;
}

</style>
</head>
<body>
<ul>
	<li>Austin</li>
	<li>Dallas</li>
	<li>Houston</li>
	<li>Amarillo</li>
</ul>
</body>
</html>
```

##### display: inline

```HTML
<!DOCTYPE html>
<html>
<head>
<title>CSS Positioning</title>
<style type="text/css">

li {
	display: inline;
}

</style>
</head>
<body>
<ul>
	<li>Austin</li>
	<li>Dallas</li>
	<li>Houston</li>
	<li>Amarillo</li>
</ul>
</body>
</html>
```

> **You Do (15 min)** 

* Create a heading for "Life Optimizer"
* Create a horizontal navigation menu underneath with the following items: 
  * Home
  * Products
  * Pricing
  * Disney Land
  * Contact Us
* Create a class called "incorrect" that hides any HTML elements using "display: hidden"
* Assign the class "incorrect" to the "Disney Land" element
* BONUS: Assign a font and background color to the navigation menu items

### "position" Property

##### static
Static is the default value. An element positioned with "position: static" is not positioned in any special way. Follows the natural flow of the document. 

##### relative
Relative behaves just like "static" unless you add "top", "bottom", "left", or "right"

```HTML
<!DOCTYPE html>
<html>
<head>
<title>CSS Positioning</title>
<style type="text/css">

ul {
	position: relative;
	top: 400px;
	left: 50px;
}

</style>
</head>
<body>
<ul>
	<li>Austin</li>
	<li>Dallas</li>
	<li>Houston</li>
	<li>Amarillo</li>
</ul>
</body>
</html>
```

##### fixed
Fixed elements are always positioned in the same location, even if the user scrolls

```HTML
<!DOCTYPE html>
<html>
<head>
<title>CSS Positioning</title>
<style type="text/css">

body {
	background: #ccc;
}
ul {
	position: relative;
}
img {
	position: fixed;
	right: 0;
	bottom: 0;
}

</style>
</head>
<body>
<ul>
	<li>Austin</li>
	<li>Dallas</li>
	<li>Houston</li>
	<li>Amarillo</li>
</ul>
<img src="https://ga-core-production-herokuapp-com.global.ssl.fastly.net/assets/ga-lockup-1788582934ade008a8ea6068b784b8ee.png" alt="">
<footer>&copy; 2015 General Assembly</footer>
</body>
</html>
```

##### absolute 

### "width" Property

##### width: 

##### max-width:

##### margin: auto

##### "px" vs "%" vs "em"

### "float" Property

##### "clear" property

##### "clearfix"


### BONUS: 
* Look up the "box-sizing" property and see how it changes the box model 
* Look up the "inline-block" property and see how it changes how you handle floats in the future



