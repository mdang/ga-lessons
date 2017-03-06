##Scope 

We can think of scope as  when and where are variables are defined. It's the set of rules defined in the programming language that govern
the availability of our variables. 

###Lexical Scope

Often you will hear people refer to Javascript as being lexically scoped....what are they talking about? Lexical scope sounds fancy.....is it?
Not really, its a really simple statement when you break it down. 
 
 > *a simple definition*: 
 > **Lexical** - relating to words or vocabulary
 
 What does scope have to do with words or vocabulary? It's as simple as saying that a lexically scoped programming language is one
 where we can determine scope by looking at the source code. In other words it means the scope of variables and declarations are defined
 at the time when you author the code. 
 Let's look at an example in an imaginary language where the only scope rule is: *if there is a variable written, then so it exists in scope.*
 
 
 ```javascript
 
 var a;
  
 ```
 
 
 If the only rule of scope in our language is: *if a variable is written then it exists in scope*, and our language is lexically scoped, then 
 it's trivial to look at this line of source code and make the determination that **a** is in scope. The key is that lexical
 scope is scope defined at **authoring** time. When you write the code, scope can be determined based on where variables and declarations
 appear in the source code. So you can see now scope's relation to the word lexical...the words you write declaring variables determine scope.
  
 > Most programming languages are lexically scoped, so this is an important and general concept
 
 
###Scoping Rules in Javascript 
 
 
 We should start with the notion that there can be multiple scopes that exist at any one time in our program. Let's also start
 with the **very important** notion that in Javascript we *declare scopes within functions.*
 
 At this point consider the idea of each scope being a bubble, sort of a self contained unit. So what exactly is a scope or what
 does it represent?  The basic idea is that we would like to think of a scope as a bubble, inside of which the variables in that
 bubble are **visible** to other statements in the same bubble. 
 
 
 ```javascript
 
 //a function is the enclosing body for a scope.
 //scopes are defined inside functions
 function bubble () {
    var x  = 2;
 }
 
 //this will be undefined because x is not defined outside of it's 
 //scope bubble
 console.log( x ); 
 
 
 ```
 
So the real trick to understanding scope in javascript is to think of javascript as *functionally scoped*, and that 
means that functions are used to create scope bubbles. 
 
###Through the looking glass
 
 So the first thing to understand is the functionally scoped nature of javascript, the second most important thing to 
 understand is the rule governing scope interaction. You might ask the question..'What happens when I declare a function 
 inside of a function...how does scope look then?'. 
 
 
 If you consider an interrogation room with a two way mirror, you can see that when the interrogation room is bright, and the 
 'observation room' is dark, then like in the movies you can picture detectives watching an interrogation while those in the interrogation
 room cannot see through the mirror into the observation room. 
 
 Scope works like this in javascript, where you can imagine the inner most function as the detectives sitting in the observation room, unseen
 by the outer function in the interrogation room. 
 
 
 ```javascript
 
 
 function outer () {
 
     var visibleToInner  = 1; 
     
     function inner() {
        
        console.log(visibleToInner); 
           
        var hiddenFromOuter = 2;   
     
     }
     
    //executing inner we can see visibleToInner is defined inside
    //the inner function
    inner();  
   
    console.log(hiddenFromOuter); //hiddenFromOuter will be undefined  
 
 
 }
 
 
 ```
 
 An important thing to remember is that when the javascript engine is resolving scope, it starts with the current scope and then tries to find
 variables in each successive parent scope, and it will use the first match it finds. 
 
 ```javascript
 var x  = 3;
 
 function getX () {
    var x  = 4;
    
    console.log(x); //output: 4
 
 }
 getX();
 ```
 
 In the above example, when we redefine x inside of our function, it covers up, or obscures the variable x declared outside the scope of our
 getX function. This shadowing can be useful and leaves the outer x variable unchanged. It's important to really understand this effect as things 
 will get confusing if you don't. 
  
  
###When are things defined?

####Hoisting

Hoisting is the name we give to the operation whereby certain statements appearing at any point in the source code behave as if they were declared
at the top of our source file, having the effect of escaping the 'line by line' order of execution and variable definition. 

It's common in Javascript to say that *function declarations are hoisted, but function expressions are not.* 

```javascript

aFunction();

function aFunction () {

  console.log( "Running code inside the function" );   

}

// The above code works because the function declaration
// is hoisted. 
//-------------------------------------------------------

anotherFunction();

var anotherFunction = function() {

  console.log( "Running some more code inside a function" );
};

// The code above fails because a function expression is not
// hoisted. IMPORTANT Error is : 'TypeError: anotherFunction 
// is not a function'
//-------------------------------------------------------

doesNotExist();  

// IMPORTANT: Fails silently, like it never existed
//-------------------------------------------------------
```

Understanding the first example in the above code is pretty straightforward, a function declaration is hoisted, so the call to aFunction()
succeeds and the code executes as expected. 

```javascript
//This is what the javascript engine would see for the first example
//because function declarations are hoisted.

function aFunction () {

  console.log( "Running code inside the function" );   

}

aFunction();

The second example throws an error, but curiously its not an error like: 'anotherFunction' is not defined. It tells us that the Type of anotherFunction
is not a function, but it seems to know about a thing called anotherFunction. The next section will help shed some light on this situation. 

The third example just fails without any warning or errors, this is important to take note of, you won't get any help from the javascript engine
if you try and execute a function with absolutely no declaration whatsoever at any point in your source files. 


####Another Nuance
  
What is the result of the following javascript code executing?
  
```javascript

something = 2;

var something;

console.log( something );
  
  
```  
  
Do you expect that 're-declaring' *something* after we assign 2 to it will result in *something* being undefined?  
What you may not have known about javascript is that *var* declarations are hoisted, not just functions. Code like the above can help illustrate this confusing point. 
The *var something;* declaration is hoisted, and therefore appears before *something = 2;* from the perspective of the engine. This is why the output is 2. 

```javascript

//-----------------
//WHAT YOU WRITE

x();

var x  = function() { return true;}





//-----------------
//WHAT THE JAVASCRIPT ENGINE SEES

var x; //the var declaration is hoisted

x();  //attempt to execute x as a function

x = function() { return true; }  //assignment is not hoisted

//result of this code is: 
//Uncaught TypeError: x is not a function

```

So in the above code we can see how the **var x** declaration is hoisted so that x is defined, however the assignment part occurs after we try to execute the function, 
so we get the type error. 


###Notes on why scoping is important

Why not just put everything into one scope, after all, then everything would be easy to get at right? Yes, everything would be easy to get at, and that's
exactly why we want as few things in the global scope as possible. When you have a bunch of stuff in one scope(let's say global), then the potential
for undesirable interactions increases dramatically.
  
```javascript

//x declared globally  
var x = 1; 

//a function is called that modifies x  
modify();

//another function that uses x is called, but expects
//x to be in the state it was in before the previous function changed it.  
expectedUnmodified();
  
function modify() {
    x++;
}  
  
function expectedUnmodified() {
   return x === 1;
}
 
```

What happened above is we have one function that is expecting a variable to be one value, but another function has modified it.  
 
What we would like to do is encapsulate and 'scope away' most of the visible state of our programs, leaving exposed only
the minimum functionality to get the job done. 

One way we can help do this is by creating a namespace. 


```javascript
var x = 1;

//create a Namespace of 'MYAPP'
var MYAPP = {

  x : window.x, //make a copy of the global x
  modify : function(){
     this.x++;
  
  } 

};

//we have a MYAPP namespace, and all variables and functions are referenced by
//making calls to MYAPP
MYAPP.modify();
console.log( MYAPP.x );

expectedUnmodified();
  
function expectedUnmodified() {
   return x === 1;
}


console.log( expectedUnmodified() ); //true, global x is untouched

```

In the above code we have created a namespace of MYAPP. Inside of the MYAPP object is where we will define all of our functionality. This idea of a namespace helps
make your code a 'good neighbor'. 

It's very easy with the amount of javascript code on any one page to have name collisions or otherwise 
undesirable effects where one library expects a variable named a certain way to have this value, but your code modified a variable with the same name without realizing
it...etc. The best thing to do is to create namespaces or modules for your code to prevent these types of interactions. 

