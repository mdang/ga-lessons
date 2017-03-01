# ![](https://ga-dash.s3.amazonaws.com/production/assets/logo-9f88ae6c9c3871690e33280fcf557f33.png) CSS Selector Basics (90 min)

| Timing | Type | Topic |
| --- | --- | --- |
| 5 min | [Opening](#opening) | CSS |
| 20 min | [Intro to New Material](#introduction) | What is CSS? |
| 15 min | [Demo](#demo) | CSS Tools of the Trade |
| 45 min | [Independent Practice](#ind-practice) | CSS Challenges |
| 5 min | [Conclusion](#conclusion) |Review and Questions |

### LEARNING OBJECTIVES
*After this lesson, you will be able to:*

- Style HTML elements on a web page.
- Style copy elements using font-weight, font-size, color, line-height, letter-spacing, text-transform, text-decoration, and text-align.
- Understand best practices for specificity and cascading.
- Understand why external CSS sheets are better than inline styles.
- Describe the syntactical and functional relationship between selectors, properties, and values.
- Use special selectors (descendant, adjacent sibling, direct child, universal).
- Apply a set of styles to elements based on pseudo-classes (:hover, :active, :visited, :even, :odd, :nth-child, :first-of-type, :last-of-type).
- Apply styles to specific elements using classes and IDs.
- Apply styles using the Desktop Down method.


### STUDENT PRE-WORK
*Before this lesson, you should already be able to:*

- Write HTML that renders as a document in the browser.
- Use HTML tags to add content to a web page (h1-h6, p, a, img, ul/ol).
- Use HTML tags to define groups of content: header, main, section, article, aside, figure, figcaption, and footer.
- Pass The CSS Validator without errors.

### INSTRUCTOR PREP
*Before this lesson, instructors will need to:*

- Be ready to assess students' understanding of HTML.

---

<a name="opening"></a>
## Opening: (5 min)
- Review the purpose of HTML.
- Remind students of CSS' relationship to HTML.

***

<a name="introduction"></a>
## Intro to New Material: What is CSS? (20 min)

#### Overview
Cascading Style Sheets (CSS) transform the content on your web page into a well-designed website. While HTML's purpose is to define what content *is*; CSS's purpose is to define how content should *look*.


### Initial Styles
Keep in mind that, even without CSS, your site has design. It's not very *good* design, but design decisions have been made nonetheless. What styles can you identify?

- White background
- Black color
- Times New Roman font
- Left text alignment
- Bold headers
- Blue, underlined links
- Round, solid black bullets for list items
- Predetermined font sizes
- Predetermined margin and padding
- Predetermined display (inline vs. block)

These styles are called inherent or initial styles. Adding CSS is all about overriding these initial styles to create a customized web page. CSS is powerful! Consider the incredible diversity of design in [these websites](http://www.mezzoblue.com/zengarden/alldesigns/), all of which have the same HTML, but different CSS.

You can do [a lot with very little](http://jgthms.com/web-design-in-4-minutes/) using CSS. And, if you want to go the extra mile, you can accomplish some [seriously amazing things](http://codepen.io/). This lesson is a step toward building a working knowledge of CSS and solidifying what you learned in the pre-work. Your goal isn't to memorize the 500+ CSS properties — it's to get an idea of what you can accomplish with CSS and how to research what you don't already know.

Keep in mind that you don't have to be a designer to be good at CSS, but you do have to be detail-oriented and thoughtful about your code. When it comes time to show off your projects after this course, the first thing most prospective employers will see is your styling. And, as we all know, first impressions are incredibly important.


### Review: Structure of CSS
A CSS file is composed of many rules. Each rule governs the appearance of certain elements. A style rule looks like this:

```css
selector {
    property: value;
    property: value;
    property: value;
}
```

Everything inside the curly braces is called the "declaration block." Individual property and value pairs are called "declarations."


### Review: Classes and IDs
Sometimes, just targeting an element is not enough. We can also target other attributes of an element in our selectors.

*Classes*: Used for repeatable styles applied multiple times within one or more pages on a website.

```html
<div class="column"></div>
```
```css
.column {}
```

*IDs*: Used for elements on a page that apear only once — each `id` on a page must be unique.

```html
<div id="hero"></div>
```
```css
#hero {}
```

**Note** Because IDs can override classes, they can make a codebase more difficult to maintain as it scales. Using classes in your CSS is preferable; it will help you writer cleaner code and assist with the scalability of your design. IDs become more useful in JavaScript.


### Specificity Within the Cascade
Some properties of elements are passed down to their children. In general:

- Properties dealing with text are inherited by their children.
- Properties dealing with spacing are not inherited by their children.

View the full property table [here](https://www.w3.org/TR/CSS2/propidx.html).

When an element is being styled by more than one rule, the browser calculates which rule is more specific and applies its styles. In general:

- Class rules will override element selector rules.
- If two classes are applied, the second class will override the first.
- An ID will override both a class and an element selector.

In certain situations, special selectors *can* override both classes and IDs. So, choose your methods carefully, and keep your code dry.

Consider the following code:

```html
<p class="intro hidden" id="highlight"></p>
```
```css
p { 
	font-size: 1em;
}

.intro {
	font-size: 2em;
}

.hidden { 
	font-size: 0;
}

#highlight { 
	font-size: 3em;
}
```

This is not an example of efficient code, but it will help us to demonstrate the cascade. Here's how the code above will be calculated:

- The `font-size` of `1em` in `p {}` will be overridden by the `font-size` of `2em` in `.intro {}`.
- The `font-size` of `2em` in `.intro {}` will be overridden by the `font-size` of `0` in `.hidden {}`.
- The `font-size` of `0` in `.hidden {}` will be overridden by the `font-size` of `0` in `#highlight {}`.
- A `font size` of `3em` will render.

Keep in mind, specificity can work to your advantage because of inheritance. If you put shared styles for all paragraph tags in `p {}` and more specific styles in classes, your code will be efficient and non-repetitive.

Consider an updated version of the previous example:

```html
<p class="intro visible" id="highlight"></p>
```
```css
p { 
	font-size: 1em;
}

.intro { 
	color: #333; 
}

.visible { 
	visibility: visible;
}
#highlight { 
	background-color: #ffff00;
}
```

The result? All of these styles will be applied, because the same property is not being called with a different value.

> **Check**: Describe which selectors override which (element, class, ID).

#### Special Selectors
Selectors can be more complex than just an element, class, or ID. In fact, special selectors may be preferable over classes in some cases.

##### Multiple Selector
Applies the same declaration block to more than one element.

```css
h1, h2 {}
```
- Styles all `<h1>` and `<h2>` tags.


##### Tag-Qualified Selector
Specifies elements with an applied class.

_Example 1_

```css
a.visible {}
```

- Styles only anchor tags with the "visible" class: ```<a class="visible"></a>```; will not style any other elements with an applied "visible" class such as ```<p class="visible"></p>``` or ```<img class="visible">```.

_Example 2_

```css
.profile.minimized {}
```

- Styles all tags that have both the "profile" and "minimized" classes applied: 

```html
<div class="profile minimized"></div>
```

**Best Practice Check**: What's the best way to work with classes — with tag qualifiers, or without?

A: Using a class *without* a tag qualifier is a more scalable way to work because it's less specific. Remember that classes are meant to style a number of elements — not just one.

If you choose to use tag-qualified selectors, be sure that it's the simplest approach possible and that you have a good reason for doing so. Here's an example of a tag qualifier that's not helpful:

```css
div#hero {}
```

Although this code will work, there's only ever going to be one tag with an ID of "hero," as IDs are unique. It's simpler to write:

```css
#hero {}
```


##### Descendant Selectors
Filter out tags based on their ancestors.

```css
main p {}
```
  
- Styles all `<p>` tags that are descendants of `<main>` tags:


```html
<main>
    <p></p>
</main>

and
<main>
    <section>
        <p></p>
    </section>
</main>
```
Be sure you don't overuse descendant selectors, because they can slow down your page. Although we read them left to right (select `<main>`, then `<p>`), the browser reads them right to left. First, the browser selects all `<p>` tags and then selects only those inside `<main>`.

Below is an example of how not to use descendant selectors. You can imagine that descendant selectors can overwhelm a browser:

`main section ul li a { }`

This type of CSS will also make our projects much less scalable. Imagine that we decide to _slightly_ change the structure of our HTML by moving or removing one of those ancestor elements. Our styles will no longer be applied! 

When we write CSS like this, it closely relies on the structure of our HTML, which makes it difficult to update.

As a general rule, limit the number of selectors to 2-3, max. If we need to use more than 2-3 selectors, we should consider using a class instead.

##### Direct Child Selectors
Filter out only first-generation child tags.

```css
main > p {}
```

- Styles all `<p>` tags that are direct, first-generation descendants of `<main>` tags.

```html
<main>
     <p></p>
</main>
```

 - *Will not* style children that aren't direct descendants, such as this "grandchild," `<p>`:
  
```html
<main>
     <section>
         <p></p>
     </section>
  </main>
```

##### Adjacent Sibling Selectors:
Filter sibling tags that appear in a stated order and style the second sibling.

```css
h2 + p {}
```

- Styles any `<p>` that follows an `<h2>`:

```html
<section>
    <h2></h2>
    <p></p>
</section>
```

- *Will not* style an element that is not adjacent:

```html
<section>
    <h2></h2>
    <h3></h3>
    <p></p>
</section>
```

- *Will not* style an element that isn't a sibling:

```html
<section>
    <h2></h2>
    <div>
      <p></p>
    </div>
</section>
```

##### Universal Selector:
Selects all tags on the page *without* using ancestry.

```css
* { 
	margin: 0; 
}
```

- Styles *every single* tag on the page without using inheritance. So, if any tags that appear on your page do not have a `margin` declaration of their own, their `margin` will be `0`.  

**Note**: This is a very powerful selector and can slow down your page if it is not used properly. Read more about universal selectors [here](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors).  


> **Check:** Identify the following special selectors:
> 
> 1. `p + p`  
> 2. `p > a`  
> 3. `section p`

***

<a name="demo"></a>
## Demo: CSS Tools of the Trade (15 min)

### Tools of the Trade
Oftentimes, dealing with CSS can be a pain. Getting a web page to look the way you want will take a lot of experimentation, iteration, and patience as you learn the most efficient ways to code. Here are some great resources to help you master CSS:

- The [CSS Validator](http://jigsaw.w3.org/css-validator/#validate_by_input) is a tool in which you can copy and paste your CSS, and it'll tell you precisely what's wrong with the code. We expect you to validate your CSS throughout this course.

- [The Chrome Element Inspector](https://developers.google.com/web/tools/chrome-devtools/inspect-styles/?hl=en) allows you to look at a specific element on a web page and see exactly which CSS rules have been applied. You can also turn rules on and off, modify rules, and create new rules, which makes experimenting within the Inspector a fast way to fine-tune your designs. 
	- **Note:** These edits don't change your file and will reset when you refresh the page.

> Instructor Note: Briefly walk the class through each of the tools listed above.
 ***

### Research & Debugging
The purpose of this course isn't for you to walk away as an expert in all things CSS. That comes after months of tolerating many unexpected, at times counterintuitive, results. The goal is to expose you to all the things that can be accomplished using CSS. If they're on your radar, you can continue to work with them and expand your skill set.


What should you do if a concept is unfamiliar?

- Read it like English. CSS is intended to be readable.
- Look it up! If you don't know what box-sizing means, search "CSS box-sizing."
	- Even professional developers rely heavily on sites like Stack Overflow in their day-to-day workflows. Why? There's simply too much to memorize and too many unique situations to encounter. Don't feel like an amateur when you turn to Google for answers — feel like a pro!

***

<a name="ind-practice"></a>
## Independent Practice: CSS Challenges (45 min)

> Instructor Note: This can be done independently or in groups.

Navigate to [CodePen](http://codepen.io/), create a new Pen, and complete the following tasks:  

#### List some common element properties that can be styled.

- Create an HTML page with a `p` tag and some placeholder text. 
- Change its text color to a hex value you choose from [Adobe Color](http://color.adobe.com).
- Give it a background color.  
- Increase the text size.
- Change its `font-family` to "sans-serif."
- Make the text bold. 
- Center the text.

#### Describe IDs and classes. Explain when we should use each.  

- Add two more `p` tags.  
- Give one `p` tag an ID.  
- Give the other two `p` tags the same class.  
- Use only IDs and classes to style the `p` tag with the ID differently than the ones with the class.

#### Describe "the cascade."

- Create a `p` tag within a `section` tag.  
- Add text in the `section` tag, outside of the `p` tag.  
- Add some text within the `p` tag.
- Style the `section` tag to give its text some color.
- Note that the `p` tag has also been affected.  

#### Describe how to combine various selectors.

- Create a rule for all `p` tags that also have a class of "active."  
- Within this rule, make the text bold.  
- Add an "active" class to a few of your `p` tags.  
- Create a rule for all `div` tags that also have a class of "active." 
- Within this rule, make the text very large.  
- Create a `div` tag with the class of "active."  

#### Describe specificity.

- Create a rule for the tag with an ID of "blue."  
- Set the text color for this rule to blue.  
- On the next line of your CSS file, create a rule for all tags with the class of "red."  
- Set the text color for this rule to red.  
- In your HTML, create a `span` tag with both an ID of "blue" and a class of "red."  
- Note that the color of the `span` tag should be blue.  

> **Check**: Were you able to create the desired deliverables? Did they meet all necessary requirements/constraints?  

> Instructor Note: Ask students to share their challenges with the class.

***

<a name="conclusion"></a>
## Conclusion (5 min)
- During the independent practice, which rules did you find to be most challenging? Why?
- Imagining a site that you visit often, what are some examples of content for which special selectors might be useful?
- Is there a special selector you **wish** existed?

***


### Hungry for More?
#### Exercises
* [CSS, Animal Style](exercises/animal-style)
* [CSS Color Box](exercises/color-box)
* [CSS Diner](http://flukeout.github.io/)

#### Readings  
* [Shay Howe's HTML/CSS Guide](http://learn.shayhowe.com/)  
* [30 CSS Selectors You Must Memorize](http://code.tutsplus.com/tutorials/the-30-css-selectors-you-must-memorize--net-16048)  
* [Specifics on CSS Specificity](https://css-tricks.com/specifics-on-css-specificity/)  
* [CSS Specificity](https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity)  
* [Typography/Web Fonts](http://practicaltypography.com/typography-in-ten-minutes.html )  

#### Tools and References
* [CSS Specificity Calculator](http://specificity.keegan.st/)
* [Web Design in Four Minutes](http://jgthms.com/web-design-in-4-minutes/)
* [CSS Visual Reference](http://cssreference.io/)
* [LearnLayout.com](http://learnlayout.com/)
    - A great interactive tutorial that details CSS' many properties and quirks.  
* [Mozilla Developer Network CSS Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)  
    - Like W3Schools, but with much more detail.    
    - [Universal Selectors](https://developer.mozilla.org/en-US/docs/Web/CSS/Universal_selectors)  
* [CanIUse.com](http://caniuse.com/)
    - Search for a CSS property (or HTML, or JavaScript), and it will tell you which web browsers support its function.  
* [CSS Validator](https://jigsaw.w3.org/css-validator/#validate_by_input)
    - Copy and paste your CSS here, and it tell will you what's wrong with the code.  
* [Codrops](http://tympanus.net/codrops/css_reference/)  
* [CodePen](http://codepen.io/)  
* [mezzoblue](http://www.mezzoblue.com/zengarden/alldesigns/)  


#### Videos
* [Intro to CSS](https://www.youtube.com/watch?v=xWiT2TWCFjc&list=PLdnONIhPScST0Vy4LrIZiYKpFNoxgyH7J&index=3)
* [CSS Foundations: 1 of 2](https://www.youtube.com/watch?v=aLtWccm8Ayo&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW&index=107)
* [CSS Foundations: 2 of 2](https://www.youtube.com/watch?v=A9Mn2UoUW-k&index=115&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW)
* [CSS Colors, Backgrounds, and Font Basics](https://www.youtube.com/watch?v=UMMHsQPmfug&list=PLdnONIhPScST0Vy4LrIZiYKpFNoxgyH7J&index=4)
* [CSS Selectors](https://www.youtube.com/watch?v=g0Aq2kP5-CY&list=PLdnONIhPScST0Vy4LrIZiYKpFNoxgyH7J&index=5)
* [CSS Family Selectors](https://www.youtube.com/watch?v=Zudl-fCDSdM&index=14&list=PLdnONIhPScST0Vy4LrIZiYKpFNoxgyH7J)
* [CSS Attribute Selectors](https://www.youtube.com/watch?v=PuF0drOMN3E&list=PLdnONIhPScST0Vy4LrIZiYKpFNoxgyH7J&index=15)
* [CSS Pseudo Selectors: 1 of 4](https://www.youtube.com/watch?v=O9dpZj4XWmA&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW&index=113)
* [CSS Pseudo Selectors: 2 of 4](https://www.youtube.com/watch?v=sd8xY2jUXpc&index=112&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW)
* [CSS Pseudo Selectors: 3 of 4](https://www.youtube.com/watch?v=c-AsuaboyeI&index=111&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW)
* [CSS Pseudo Selectors: 4 of 4](https://www.youtube.com/watch?v=s7hM9RDgkRY&list=PLae1he6d1WImFXtLgPt7MDAx6k6iP59EW&index=114)
* [CSS Pseudo Selectors: Links](https://www.youtube.com/watch?v=YMZGPqNDn_s&list=PLdnONIhPScST0Vy4LrIZiYKpFNoxgyH7J&index=17)
* [CSS Pseudo Selectors: Children](https://www.youtube.com/watch?v=tMCahu7H-fA&index=18&list=PLdnONIhPScST0Vy4LrIZiYKpFNoxgyH7J)
* [CSS Pseudo Selectors: nth-child](https://www.youtube.com/watch?v=yFmwjX9oGt8&index=19&list=PLdnONIhPScST0Vy4LrIZiYKpFNoxgyH7J)
