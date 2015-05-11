## Responsive Web Design

### Lesson Objectives

* Describe the benefits of using responsive design
* Describe what it means to go mobile first
* Explain the difference between a responsive website and a mobile-specific website
* Use media queries to target viewport sizes
* Using responsive images
* Using responsive video
* Describe some common responsive design patterns 
* Understand the difference between SVG and PNG
* Describe the differences when designing for larger screens
* Describe how to test responsive layouts while developing
* Create a responsive layout that adjusts according to the screen/window size

### Opening Framing
#### What

Responsive web designs adapt their layout according to the screen size of the viewer's device. 

#### Why

To support the huge plethora of screen sizes available today. Every screen size imaginable exists, from large TV/projectors to smart watches. 

### I do, we do, you do

#### Describe what it means to go mobile first 

Start with a mobile optimized website with the most important content/features, then build a more fully featured desktop version on top of that. 

#### Why is it important to go mobile first? 

In early 2014, mobile internet usage surpassed PC internet usage for the first time. Most of this is traffic from apps, but easily shows how important designing for mobile is. 

Earlier this year, Google stopped displaying websites that are not mobile friendly in mobile search results.  

In the US:

* 94% of users search for local information on their phones. Nearby restaurants, directions, etc. 
* 77% of all mobile searches are done at home, where the user also has access to their PC

#### How do you make websites mobile friendly? 

Test your site to see if it's mobile friendly: 
> https://www.google.com/webmasters/tools/mobile-friendly

* Figure out the main objectives for the site and make it easy for them to accomplish these objectives 
* Use a responsive web design that lays out content optimized for the current screen size
* If the user has to pinch/zoom to view content, then it's not considered mobile friendly
* Keep users in one browser window, it can often be difficult to navigate back
* Even better, keep them on the same page and minimize full page loads when possible
* Do not use fixed width elements 
* 


#### Differences between a responsive website and a mobile-specific website

**Responsive Web Design**

Automatically adapts and adjusts itself to the available viewing area

PROS
* One website and codebase for multiple devices - easier to maintain 
* One website url, no redirects to something like m.facebook.com
* Lower cost of development - 1 website instead of 2

CONS
* You're trying to optimize the UX for two very different platforms
* Some older devices and browsers won't present the design as you'd expect

**Mobile Specific Website**

PROS
* User experience is optimized for both platforms. Fully takes into consideration the benefits and downsides of each platform
* Speed - No downloading any unneccessary code, page will load faster 

CONS 
* Cost - More expensive to maintain two sites 
* Multiple URL's. User has to know both URL's or more likely have to wait for a redirect which will delay the process a couple of seconds

#### Set the viewport

The meta viewport tag gives the browser instructions on how to control the page's dimensions and scaling

```HTML
<meta name="viewport" content="width=device-width, initial-scale=1">
```

**width=device-width** Mobile browsers will by default render the site at a desktop screen width and then try to make that content look better by increasing font sizes and scaling the content. This setting instructs the browser to set the width to the actual device width and reflow content according to the actual screen size. 

**initial-scale=1** When changing the orientation of the device, mobile browsers will keep the page width constant and zoom into the content. This attribute instructs the browser to use a 1:1 relationship between CSS pixels and device pixels regardless of orientation.

[gist]

#### Size content to the viewport

Don't use fixed widths 

**I Do 10min** - Show example of a page in a fixed layout 

#### Use media queries to target viewport sizes


#### Using responsive images


#### Using responsive video


#### Describe differences when designing for larger screens


#### How to test responsive layouts while developing

Using Chrome emulation tool 

#### Responsive Web Design Patterns

Common techniques for achieving responsive layouts. Emerging quickly

> https://developers.google.com/web/fundamentals/layouts/rwd-patterns













