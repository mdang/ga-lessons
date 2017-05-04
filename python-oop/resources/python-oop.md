# OOP Python 

### Learning Objectives

* Create a function that takes arguments 
* Create instances of an object from a custom class
* Create a module and import functions into a file 
* Explain why design patterns exist and why they're useful

## User Defined Functions

A function is a group of instructions, also known as a `named procedure`, used by programming languages to return a single result or a set of results. 

Functions are a convenient way to divide our code into useful blocks, providing us with order as well as making the code more readable and reusable.

Here is how you define a function in python:

```python
def function_name(input1, input2...): 
    # 1st block of instructions 
    # 2nd block of instructions
    # ...
```

Let us define a function that returns the square of the input value:

```python
def square(x):
	"""Return the square of x.
	"""
	return x ** 2
```

We can call this function as follows:

```python
length = 7
squared = square(length)

print squared
```

```python
def rect_area(width, height):
    return width * height

width = 10
height = 15

rect = rect_area(width, height)
```

> Note: Explain that the mathematical constant `Pi` is included in the `math` module.

```python
# We are importing the value of pi from 
# that module - Easy to read, right?
from math import pi

def circle_area(r):
	return pi * r**2

r = 3
area = circle_area(r)
print area
```

### Exercise 

**10 min**

https://gist.github.com/mdang/ba9f9f395a4e6c262f29d94ae37aed18

### Exercise 

**Pair Exercise**
**20  min**

Starter: https://gist.github.com/mdang/d82ab16ae5129c47a1ea9457b79ebf09

Solution: https://gist.github.com/mdang/fed8c53303dbd479fee4d40dda5a80bf

## Classes

### "new" style classes

http://stackoverflow.com/questions/4015417/python-class-inherits-object

#### Instantiating classes

#### Constructors 

#### self keyword

#### Static vs Instance methods 

```@staticmethod``` keyword

http://stackoverflow.com/questions/136097/what-is-the-difference-between-staticmethod-and-classmethod-in-python

```python
"""Question:
    Define a class, which have a class parameter and have a same instance parameter.

Hints:
    Define a instance parameter, need add it in __init__ method
    You can init a object with construct parameter or set the value later

Solution:
"""
class Person:
    # Define the class parameter "name"
    name = "Person"
    
    def __init__(self, name = None):
        # self.name is the instance parameter
        self.name = name

jeffrey = Person("Jeffrey")
print "%s name is %s" % (Person.name, jeffrey.name)

nico = Person()
nico.name = "Nico"
print "%s name is %s" % (Person.name, nico.name)
```

## Design Patterns

### 4 principles of object oriented design

* Polymorphism - Common interface 
* Inheritance 
* Encapsulation - private, protected, public - hiding implementation details
* Abstraction - Only showing and implementing what is neccessary 

### Inheritance

- Multiple Inheritance 

### Composition

### Encapsulation 

#### Private attributes with _

## Exercises

- Get with the person next to you, discuss why design patterns are useful and some of the different types out there

### Exercise

**20 min**

```python
"""Define a class named Shape and its subclass Square. The Square class has an init function which takes a length as argument. Both classes have a area function which can print the area of the shape where Shape's area is 0 by default.

Hints:

To override a method in super class, we can define a method with the same name in the super class.

Solution:
"""
class Shape(object):
    def __init__(self):
        pass

    def area(self):
        return 0

class Square(Shape):
    def __init__(self, l):
        Shape.__init__(self)
        self.length = l

    def area(self):
        return self.length*self.length

aSquare= Square(3)
print aSquare.area()
```

```python
"""Define a class named Rectangle which can be constructed by a length and width. The Rectangle class has a method which can compute the area. 

Hints:

Use def methodName(self) to define a method.

Solution:
"""
class Rectangle(object):
    def __init__(self, l, w):
        self.length = l
        self.width  = w

    def area(self):
        return self.length*self.width
	
aRectangle = Rectangle(2,10)
print aRectangle.area()
```

## Modules

Ref: https://docs.python.org/2/tutorial/modules.html

* the pythonic way for constants is to not grow a class for constants. Just have some const.py with PI = 3.14 and you can import it everywhere. from const import PI

### Exercise

- Create a module with user defined functions. Import them into another file 

### References

- https://docs.python.org/2.7/tutorial
- https://github.com/zhiwehu/Python-programming-exercises
