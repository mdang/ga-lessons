# Functions - Problem Set

These problems will use your knowledge of looping and conditionals, and we will build functions on top of that.

---

##Problems

### Functions Quiz

What is alerted in each case? Write down your answer before running the code.

1.

function foo(){
  function bar() {
      return 3;
  }
  return bar();
  function bar() {
      return 8;
  }
}
alert(foo());
2.

function foo(){
  var bar = function() {
      return 3;
  };
  return bar();
  var bar = function() {
      return 8;
  };
}
alert(foo());
3.

function foo(){
  return bar();
  var bar = function() {
      return 3;
  };
  var bar = function() {
      return 8;
  };
}
alert(foo());


### Square (simple)

It would be really nice if there was a function that did exponents for us. Create a square function, it should:

Take an argument that is a number
the function's output should return the number squared
It should look something like this:

square(4)
=> 16
Bonus- Create an exponents function

it should take 2 arguments
the first should be the base number
the second should be the power you'd like to raise the base number to.
It should look something like this:

raisePower(4, 3)
=> 64




###letterCount(word)

Write a function that takes a string that finds out how many times a character occurs.  For example, the string "apple" would print the following:

```
a - 1
p - 2
l - 1
e - 1
```

**Hint**: Loop through each letter, and increment the value to a key in an object. The key should be that object.

**BONUS**: Make sure that lower case letters and upper case letters count for the same character.  Also, ignore spaces and punctuation.

---

###sillySum(arr)
Write a function that takes an array of numbers, and returns the sum of each number multiplied by its index. 

`count += (number * index)`

---

###isPrime(num)
Create a function to return `true` or `false` if a number passed in a prime number.

---

###primes(max)
Using your `isPrime()` function, create a function `primes` that will return an array of all prime numbers up to a certain amount.

---

###numSquare(max)
Create a function called `numSquare` that will return an array of all perfect square numbers up to, but not exceeding a max number.

---

##BONUS

###merge(arr1, arr2)

Write a function called ```merge```.  The function should take two sorted arrays of numbers as input and return a merged array of the sorted numbers from the input.  For example, if the input arrays were `var arr1 = [3,6,11]; var arr2 = [2,4,5,8,9];`  Then the returned array would be: `[2,3,4,5,6,8,9,11]`.

---

## Licensing
1. All content is licensed under a CC-BY-NC-SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.