## HTML

### Lesson Objectives

* Describe what a markup language is
* Describe the anatomy of an HTML tag 
* Explain the purpose of HTML attributes
* Name 3 types of attributes that all HTML elements have 
* List the basic tags of all HTML documents
* Create a barebones HTML document structure 
* Create HTML elements using tags and attributes
* Describe what semantic HTML is and why we use it
* Create nested HTML elements
* Use indentation to make code easier to read 
* Choose a semantic HTML tag that you could use instead of a div 
* Create a list
* Include images on a webpage
* Link from one webpage to another
* Create a table with rows and columns 
* List some basic form elements used for presenting or saving data
* Additional tags that should be included when building webpages

### Opening Framing

#### What
HTML is the markup language used to create web pages.

#### Why
HTML elements are the building blocks of the world wide web.

### I do, we do, you do
Notes: 
* Periodically check for understanding as we go along
* Scaffold the exercises to increase in complexity
* Make students do the heavy lifting, ask plenty of questions

**Class Question** 
How many people here have created a webpage using HTML before? 

### What is HTML? 

HTML is ... 

#### What are HTML attributes? 


#### What 3 attributes are present in all HTML tags? 

* id
* class
* style

#### List common tags used in HTML documents 

* html, head, body, meta, title
* h1, h2, h3, h4, h5, h6
* p, div, header, footer, article, nav
* a, img
* hr, br
* ul, ol, li
* span

> **I Do** Create the barebones HTML document structure 

```HTML
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>

</body>
</html>
```

> **I Do** Create HTML elements listed above and display for the class to see

#### What is semantic HTML and why it matters

* Accessibility
* Better search engine ranking
* Easier to read and maintain code 

> **I Do** Illustrate why you would want to use "nav" or "p" instead of "div" to describe the content

```HTML
<!-- Incorrect -->
<div>This is the headline to the body of text</div>
<div>This is some text underneath the headline</div>

<!-- Correct -->
<h3>This is the headline</h3>
<p>This is some text underneath the headline</p>
```

```HTML
<!-- Incorrect -->
<div>
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>

<!-- Correct -->
<ul>
  <li>Item 1</li>
  <li>Item 2</li>
  <li>Item 3</li>
</ul>
```

> **I Do** Formatting HTML with code indenting and comments 

```HTML
<div>
  <h3>Title</h3>
  <!-- This is a list of numbers -->
  <ul>
    <li>One</li>
    <li>Two</li>
    <li>Three</li>
  </ul>
</div>
```

> **We Do** Go through code sample with entire class and mark it with semantic markup 

[CODE SAMPLE]



> **I Do** Add an image to a webpage 

> **You Do (5 min)** Create two images, one with a relative link and one with an absolute link

> **I Do** Create a link that leads to another webpage

> **You Do (5 min)** Create a list with 3 links to your favorite websites

> **I Do** Create a table to display tabular data

              | Bronze | Silver | Gold
------------- | ---------------------------------
feature 1     | x      | x      | x
feature 2     | x      | x      | x
feature 3     | x      | x      | x

> **List some basic form elements**

> **I Do** Demonstrate the following form elements: 
* input
* select

### BONUS

**Common tags that should be present in all your webpages**
* <meta> tags for search optimization, language encoding, favicon.ico
* Facebook search optimization tags 
* https://developers.facebook.com/docs/sharing/webmasters#markup
* https://developers.facebook.com/tools/debug/



