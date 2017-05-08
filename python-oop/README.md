# Python OOP

## Classes

```python
class Person():
  pass
  
someone = Person()
```

### Constructors

```python
class Person():
  def __init__(self):
    pass
```

```python
class Person():
  def __init__(self, name):
    self.name = name
    
hunter = Person('Elmer Fudd')
```

__init__() is the special Python name for a method that initializes an individual object from its class definition. The self argument specifies that it refers to the individual object itself.

## Principles of Object Oriented Design

* **Polymorphism** - Common interface among different objects
* **Inheritance**
* **Encapsulation** - private, protected, public - hiding implementation details
* **Abstraction** - Only showing and implementing what is neccessary

> “An abstraction denotes the essential characteristics of an object that distinguish it from all other kinds of object and thus provide crisply defined conceptual boundaries, relative to the perspective of the viewer.” — G. Booch, Object-Oriented Design With Applications

### Code to an Interface 

Coding to an interface is essentially agreeing to a contract. Certain methods will always be available, the implementation could possibly change but the methods you implement on the surface will remain consistent. 

For example, it would be better to design a method called `login(accessToken)` then `loginWithJWT(accessToken)` because the format of the token could change later. This shouldn't matter for the end user of the library. 

### Inheritance

> Inheriting from nothing creates an old-style class, which has different behaviour to new-style classes. As a general rule, there's no reason to favour old-style classes, so you should always inherit from `object`.

```python
class Car(object):
  pass

class Yugo(Car):
  pass
  
give_me_a_car = Car()
give_me_a_yugo = Yugo()
```

```python
class Car(object):
  def exclaim(self):
    print("I'm a Car!")

class Yugo(Car):
  pass
  
give_me_a_car = Car()
give_me_a_yugo = Yugo()
give_me_a_car.exclaim()
# I'm a Car!
give_me_a_yugo.exclaim()
# I'm a Car!
```

### Overriding Methods

```python
class Car(object):
  def exclaim(self):
    print("I'm a Car!")

class Yugo(Car):
  def exclaim(self):
    print("I'm a Yugo! Much like a Car, but more Yugo-ish.")
```

### Super

We can call the parent class with `super()`

```python
class Person(object):
  def __init__(self, name):
    self.name = name
    
class Hero(Person):
  def __init__(self, name, superpower):
    super(Hero, self).__init__(name)
    self.superpower = superpower
    
superman = Hero('Superman', 'Flying')

print(superman.superpower)
```

> With Python 3.x we no longer need to pass arguments into `super()` or pass `object` into the super class 

### Getters and Setters

```python
class Person(object):
  @property
  def name(self):
    print('inside the getter')
    return self.__name
  @name.setter
  def name(self, input_name):
    print('inside the setter')
    self.__name = input_name
```

```python
class Circle(object):
  def __init__(self, radius):
    self.radius = radius
  @property
  def diameter(self):
    return 2 * self.radius
    
c = Circle(5)
c.radius
# 5
c.diameter
# 10
```

### Class Methods

```python
class A(object):
  count = 0
  def __init__(self):
    A.count += 1
  def exclaim(self):
    print("I'm an A!")
  @classmethod
  def kids(cls):
    print("A has", cls.count, "little objects.")

easy_a = A()
breezy_a = A()
wheezy_a = A()
A.kids()
# A has 3 little objects.
```

### Packages and Modules

A module is a file containing Python definitions and statements. Modules allow us to write code in a reusable manner, any code within modules are loaded once and cached into `.pyc` files as bytecode. 

A Package in Python is just a directory with an `__init__.py` file in it. The file can be empty. Packages help us organize our code another level above just using modules. 



## Composition 

```python
class Bill(object):
  def __init__(self, description):
    self.description = description

class Tail(object):
  def __init__(self, length):
    self.length = length

class Duck(object):
  def __init__(self, bill, tail):
    self.bill = bill
    self.tail = tail
  def about(self):
    print('This duck has a', bill.description, 'bill and a', tail.length, 'tail')

tail = Tail('long')
bill = Bill('wide orange')
duck = Duck(bill, tail)
duck.about()
# This duck has a wide orange bill and a long tail
```

### Singletons

If you want only one of something, a module might be best. No matter how many
times a Python module is referenced in a program, only one copy is loaded. 

> Java and C++ programmers: if you’re familiar with the book Design Patterns: Elements of Reusable Object-Oriented Software by Erich Gamma, you can use a Python module as a singleton.



## Resources

* Introducing Python - Modern Computing in Simple Packages
