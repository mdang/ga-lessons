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

Absolute elements are removed from the normal flow and can overlap other elements. 

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
li {
	height: 100px;
}
img {
	position: fixed;
	right: 0;
	bottom: 0;
}
.relative {
	position: relative;
	left: 150px;
}
.absolute {
	position: absolute;
	left: 150px;
}

</style>
</head>
<body>
<ul>
	<li>Austin</li>
	<li>Dallas</li>
	<li class="absolute">Houston</li>
	<li>Amarillo</li>
</ul>
<img src="https://ga-core-production-herokuapp-com.global.ssl.fastly.net/assets/ga-lockup-1788582934ade008a8ea6068b784b8ee.png" alt="">
<footer>&copy; 2015 General Assembly</footer>
</body>
</html>
```

### "width" Property

##### width: 

##### max-width:

##### margin: auto

##### "px" vs "%"

* "px" - Columns, margins, padding are a set size no matter how the viewport or fonts are resized
* "%" - Columns, margins, padding are resized as the viewport is changed

### "float" Property

Using the "float" property, elements can be pushed to the left or right, allowing other elements to wrap around it.

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
	
}
li {
	background: black;
	color: white;
	width: 250px;
	margin-right: 2px;
	float: left;
	list-style-type: none;
}
footer {
	
}

</style>
</head>
<body>
<nav>
<ul>
	<li>Austin</li>
	<li>Dallas</li>
	<li>Houston</li>
	<li>Amarillo</li>
</ul>
</nav>
<footer>&copy; 2015 General Assembly</footer>
</body>
</html>
```

##### "clear" property

Elements that come after an element that has been floated will flow around it. To get out, use "clear". 

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
	
}
li {
	background: black;
	color: white;
	width: 250px;
	margin-right: 2px;
	float: left;
	list-style-type: none;
}
footer {
	clear: left;
}

</style>
</head>
<body>
<nav>
<ul>
	<li>Austin</li>
	<li>Dallas</li>
	<li>Houston</li>
	<li>Amarillo</li>
</ul>
</nav>
<footer>&copy; 2015 General Assembly</footer>
</body>
</html>
```

##### "clearfix"



```HTML
<style type="text/css">

.clearfix {
	overflow: auto;
}

</style>
```

### BONUS: 
* Look up the "box-sizing" property and see how it changes the box model 
* Look up the "inline-block" property and see how it changes how you handle floats in the future



