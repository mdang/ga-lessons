# CSS Frameworks

[Adapted from original CSS Frameworks plan]

## Learning Objectives

* Explain what a CSS reset is and why we should use one
* Explain the benefits of using a grid system to define layout
* Describe the advantages of using font icons rather than image tags or background images
* Explain the purpose of the @font-face CSS directive
* List the major CSS frameworks/libraries
* List the key features of a CSS framework and be able to compare them

### Where are we now? 

Right now, CSS is tough for us - we know how to wield it to do what we want, but there's a lot of boilerplate code we need to create every single time we want to do something

> Class question: What are some pain points for us right now? 

* Not identical across browsers
* Lots of boilerplate code
* Tedious to implement any kind of layout
* Tedious / difficult to do responsive layout scalably
* Limited to small number of web fonts
* Common UI patterns are tedious to implement

### CSS Resets

What is the point of a CSS reset? 

<img src="http://images.sixrevisions.com/2008/11/18-02_css_example.png">

From [sixrevisions.com](sixrevisions.com)

* [Eric Meyer's CSS Reset](http://meyerweb.com/eric/tools/css/reset/)
* [normalize.css](http://necolas.github.io/normalize.css/)
* [HTML5 Reset](https://github.com/murtaugh/HTML5-Reset/tree/master/assets/css)
* Write your own CSS reset

### Iconography

Font Awesome has scalable vector icons that allow you to customize the size, color, drop shadow with CSS

* [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
* [CopyPasteCharacter](copypastecharacter.com)

### Custom Fonts 

```css
@font-face {
    font-family: myCustomFont;
    src: url(customfont_light.woff);
}

div {
    font-family: myCustomFont;
}
```

[Google Fonts](https://www.google.com/fonts)

## Exercise

**15 min**

Practicing Font Awesome and Google Web Fonts

https://github.com/ga-students/wdi-atx-3-class/blob/master/w01/d04/afternoon/exercise_iconography_fonts.md

## CSS Frameworks

CSS frameworks provide a number of benefits: 

* CSS Resets
* Grids
* Buttons
* Nav menus
* Form styling
* Common UI elements (dropdowns, breadcrumbs, progress bars, alerts, etc.)
* Font icons

There are many front end frameworks available that differ in size, ability, style and more:

* [Bootstrap](http://getbootstrap.com/)
* [Foundation](http://foundation.zurb.com/)
* [Pure](http://purecss.io/)
* [Skeleton](http://getskeleton.com/)

### Bootstrap



#### Grids

A responsive grid-view often has 12 columns, and has a total width of 100%, and will shrink and expand as you resize the browser window.

[Compare how grids work across the popular CSS frameworks]

## Exercise 

**20min - Pair Exercise**

[Take website and deconstruct into grid, say what classes you would use in Bootstrap]

#### Bootstrap Themes

* [startbootstrap](http://startbootstrap.com/)
