## HTML

### Lesson Objectives

* Describe what a markup language is
* Describe the anatomy of an HTML tag 
* List common HTML tags
* Create a barebones HTML document 
* Explain the purpose of HTML attributes
* List 3 types of attributes that all HTML elements have 
* Create HTML elements using tags and attributes
* Include images on a webpage
* Link from one webpage to another
* Create nested HTML elements
* Describe what semantic HTML is and why we use it
* Create a table with rows and columns 
* List some basic form elements used for presenting or saving data
* BONUS: Additional tags that should be included when building webpages

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

> **Class Question** 
How many people here have created a webpage using HTML before? 

### What is HTML? 

HTML, or HyperText Markup Language, is used to describe web documents. It's called hypertext because you're able to jump from one document to another in a nonlinear fashion. 

Markup languages are used to describe the logical structure of a document and contains instructions on how it should be laid out.

Invented by Tim Berners-Lee in 1990. 

HTML provides the structure of the web page, while CSS (which we'll cover tomorrow) covers the appearance. You can think of HTML as the bones (structure) and CSS as the skin (appearance) 

#### List common tags used in HTML documents 

* html, head, body, meta, title
* h1, h2, h3, h4, h5, h6
* p, div, header, footer
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

Explain the difference between doctypes, what to always use but beware of XHTML and HTML doctypes also

> **I Do** Create HTML elements listed above and display for the class to see

#### What are HTML attributes? 

Attributes allow you to customize a tag. Most attributes are optional, but there are some required ones like the "src" attribute for <img> that are required for it to render correctly. 

#### What 3 attributes are present in all HTML tags? 

* id
* class
* style

#### What is semantic HTML and why it matters

* Accessibility
* Better search engine ranking
* Easier to read and maintain code 

> **I Do** Illustrate why you would want to use "p" or "article" instead of "div" to describe the content

```HTML
<!-- Bad -->
<div>This is the headline to the body of text</div>
<div>This is some text underneath the headline</div>

<!-- Good -->
<h3>This is the headline</h3>
<p>This is some text underneath the headline</p>
```

```HTML
<!-- Bad -->
<div>
  <div>Item 1</div>
  <div>Item 2</div>
  <div>Item 3</div>
</div>

<!-- Good -->
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

Life Optimizer 1.0

              | Bronze | Silver | Gold
--------------|--------|--------|-------
Feature 1     | x      | x      | x
Feature 2     | x      | x      | x
Feature 3     | x      | x      | x

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

```HTML
<!DOCTYPE html>
<html>
<head>
<title></title>
<meta charset="utf-8">
<meta name="description" content="">
<meta name="keywords" content="">
<meta property="og:title" content="My Site Title">
<meta property="og:image" content="link_to_image">
<meta property="og:description" content="Site description">
<link rel="shortcut icon" href="/favicon.ico">
</head>
<body>
</body>
</html>
```

