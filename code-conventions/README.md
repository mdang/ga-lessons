## Code Structure & Conventions

### Lesson Objectives

* Explain why coding conventions are important and why we should follow them
* Properly organize your project
* Describe the naming conventions for variables, methods
* Name methods, classes and variables correctly
* Explain what code commenting is, why it's valuable and when to use it
* Add comments to a program to ease readability and describe meaning
* Explain what 'syntactic sugar' means and how it can be useful
* Use 'syntactic sugar' operators
* Properly space and indent a program with multiple nested statements
* Describe the Single Responsibility Principle and why it's important
* Refactor a program with DRY principles

### Opening Framing
#### What

Coding conventions are centered around best practice principles for developers to follow.

#### Why

Following best practices helps to ensure that code can be easily maintained and bugs are easily discovered/fixed.

### I do, we do, you do

#### Properly organize your project

```
.
├── css
│   └── main.css
├── favicon.ico
├── fonts
├── images
├── index.html
└── js
    ├── app.js
    └── libs
        └── jquery.min.js
```

#### Describe the naming conventions for variables, methods

* variables, methods - Camel case 
* namespace, function constructors - Pascal case

#### Name methods, classes and variables correctly

- Show google.com JavaScript source: this is not how you should name your variables/functions, this code has been minimized 

#### Explain what code commenting is, why it's valuable and when to use it

- Use for pseudocode, know what you were thinking 6 months from now

#### Add comments to a program to ease readability and describe meaning

[exercise]

#### Explain what 'syntactic sugar' means and how it can be useful

Syntactic sugar is programming syntax that is designed to make code more human readable and concise. It makes the language "sweeter" for humans to read and use.

```JAVASCRIPT
arg = arg || 'default value'; // if arg evaluates to false, use 'default'
```

```JAVASCRIPT
var shadeOfBlue = useDarkBlue ? darkBlue : lightBlue;

// Same as: 
var shadeOfBlue;

if (useDarkBlue) {
    shadeOfBlue = darkBlue;
} else {
    shadeOfBlue = lightBlue;
}
```

```JAVASCRIPT 
i++;

// Same as: 
i = i + 1;
```

```JAVASCRIPT
i--;

// Same as: 
i = i - 1;
```

```JAVASCRIPT
// Multi-line strings

var str = "This is \
all one \
string.";
```

```JAVASCRIPT
// Checking value AND type 

var i = 0;
var s = "0";

if (i == s)  // true

if (i === s) // false

// Same as: 
if (typeof i === 'string' && i == s) {
    //... 
}
```

```JAVASCRIPT
var obj = {}; // Object literal, equivalent to var obj = new Object();
var arr = []; // Array literal, equivalent to var arr = new Array();
```

#### Use 'syntactic sugar' operators

[exercise]

#### Properly space and indent a program with multiple nested statements

[exercise]

#### Describe the Single Responsibility Principle and why it's important



#### Refactor a program with DRY principles

[exercise]


