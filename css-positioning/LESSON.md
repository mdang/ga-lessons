## CSS Positioning

### No Layout 

What elements look like without any styling 

### CSS Box Model

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

The "clearfix" workaround is used on parent containers with floating elements inside of them. Without it, the parent container would not get any height. 

```HTML
<!DOCTYPE html>
<html>
<head>
<title>CSS Positioning</title>
<style type="text/css">

.container {
	background: green;
}

.other {
	background: blue;
}

img {
  float: right;
}

.clearfix {
	overflow: auto;
}

</style>
</head>
<body>
	<div class="container clearfix">
    <span class="label">Some content</span>
    <img src="http://media0.giphy.com/media/v0x4zvenp9TEc/giphy.gif" alt="">
    <p>
      Uh oh... this image is taller than the element containing it, and it's floated, so it's overflowing outside of its container!
    </p>
    <div class="other">This is another div container</div>
  </div>
<footer>&copy; 2015 General Assembly</footer>
</body>
</html>
```

```HTML
<!DOCTYPE html>
<html>
<head>
<title>CSS Positioning</title>
<style type="text/css">

nav {
	width: 200px;
	float: left;
}

.clearfix {
	overflow: auto;
}

</style>
</head>
<body>
	<nav class="left">
		<ul>
			<li>Austin</li>
			<li>Dallas</li>
			<li>Houston</li>
			<li>Amarillo</li>
		</ul>
	</nav>
	<section class="right clearfix">
		<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non fermentum nibh, eu mattis turpis. Pellentesque sagittis tincidunt enim vel gravida. Mauris egestas, mauris id vehicula cursus, erat ante finibus ipsum, nec tincidunt tellus tortor non augue. Vivamus vitae dui auctor leo varius bibendum. Donec egestas nulla dui, ac tincidunt justo mattis eget. Proin vestibulum fermentum molestie. Nunc efficitur sapien non sem bibendum, id venenatis magna laoreet.</p>

		<p>Nunc volutpat vitae mauris et elementum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum auctor ex ut ex aliquet dapibus. Praesent consequat quam ut odio suscipit egestas. Nulla metus ante, ultricies et felis vitae, rhoncus faucibus ante. Nulla elit nisl, pharetra eu neque vitae, porttitor condimentum nisl. Phasellus eget mollis nisi, vitae suscipit dui. Vivamus euismod quis ligula et mollis. Integer hendrerit nisl ac ipsum eleifend sagittis.</p>

		<p>Curabitur risus elit, venenatis ac tellus nec, pharetra faucibus orci. Aliquam erat volutpat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Mauris aliquam pharetra elementum. Fusce a vehicula lectus. Etiam accumsan quis quam semper molestie. Donec molestie vehicula enim congue pellentesque. Aliquam augue eros, venenatis malesuada bibendum quis, dictum in lectus.</p>

		<p>Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Fusce vel efficitur ex, faucibus feugiat nunc. Suspendisse pellentesque nisl sit amet orci aliquet feugiat. Nullam vel sodales ipsum. Praesent iaculis laoreet tortor vitae condimentum. Donec sed orci fermentum, iaculis mi sit amet, consequat mi. Vestibulum vehicula sodales venenatis. Nunc sit amet eros at enim lacinia varius. Suspendisse potenti. Donec a luctus lacus, sit amet fermentum sem. Donec bibendum varius odio, sit amet ultrices nisl vehicula ut. Suspendisse blandit, nunc nec cursus posuere, nunc lorem venenatis augue, nec imperdiet lorem quam eu orci. Phasellus ac orci et urna volutpat laoreet commodo vitae massa.</p>
	</section>
<footer>&copy; 2015 General Assembly</footer>
</body>
</html>
```

> **You Do** Using the previous code, create a menu with floating menu items that are each 200px wide. Then use percent instead to fill up the entire page.

### BONUS: 
* Look up the "box-sizing" property and see how it changes the box model 
* Look up the "inline-block" property and see how it changes how you handle floats in the future


