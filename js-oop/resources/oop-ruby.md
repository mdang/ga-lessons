## Object Oriented Programming (OOP)

### Learning Objectives

* Explain what object-oriented programming is
* Describe abstraction and how it applies to objects
* Explain the usage of inheritance
* Use "self" to reference an object instance
* Use "super" to inherit data from a parent class
* Explain the difference between public, private, and protected methods
* Explain what encapsulation means and why it is important
* Write a class that inherits from another class
* Create multi-file Ruby programs using 'require_relative'

## Review

A class is just a way of organizing and producing objects with similar attributes and methods.

Objects have methods, which you've seen before, and attributes, which are just data. For instance, in

```ruby
"Matz".length
# ==> 4
```

the "Matz" object is a string with a .length method and a length attribute of 4.

#### Variables

```ruby
# global variable -> "#{$foo}"
$foo

# instance variable -> instance.foo
# Variables belong to the instance for example first_name for a Person object
@foo

# class variable -> Class.foo
# Class variables are like instance variables, but instead of belonging to an instance of a class, they belong to the class itself
# They are shared among all instances of a class
@@foo

# local variable
def do_something
  foo = true
end 
```

####  Class methods

```ruby
class Computer
   @@users = {
   	:foo => 'val1',
   	:bar => 'val2'
   }
   def initialize

   end

   # Class/static method
   def self.get_users
        @@users 
   end
end

puts Computer.get_users
```

#### attr_reader, attr_writer, attr_accessor

``` attr_reader ``` creates a getter for an instance variable

```ruby
class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

# same as:
def name
  @name
end
```

``` attr_writer ``` creates a setter for an instance variable

```ruby
class Person
  attr_writer :name
  def initialize(name)
    @name = name
  end
end

# same as:
def name=(value)
  @name = value
end
```

``` attr_accessor ``` creates both a getter and setter

## What is object oriented programming?

OOP works with entities/events from real life (e.g. photo, album, invoice, order, shopping cart, etc). Objects describe characteristics (properties) and behavior (methods) of such real life entities.

Programmers define the data type for a particular data structure, as well as the operations (methods) that can be applied to that data structure. They can also create relationships between these data structures as well.

### OOP vs. Procedural programming

Procedural
* Code reuse is hard, you can reuse prodedures or actions but not very flexible 
* Usually very specific to data types, entities it works with
* Unable to logically group related functionality

OOP
* Makes developing complex software faster 
* Easier to maintain 
* Reusability 
* Group related attributes (data) and methods
* Isolated dependencies, easier to work in large teams 

### Fundamental Principles

#### Abstraction

Abstraction is the process of taking away characteristics from something to reduce it to only what's essential. In OOP a developer hides all irrelevant data about an object in order to reduce complexity.

A real world example of this might be you (the object) meeting someone for a blind date (the procedure). You include the relevant details, like hair color, height, jacket color, what clothes you're wearing, etc. You abstract out the unneccessary details about you like social security number, what you had for dinner yesterday, etc. These details won't help the date find us. Entities can have any number of abstractions, so you could include these extraneious details in different objects depending on the context. In another context for example, you could be an employee object, where SSN might be relevant.

#### Encapsulation 

Encapsulation is related to abstraction. It involves hiding the unnceccessary implementation details of our classes and provide a clean and simple interface for working with them. A user should be able to call a method like "create_pdf" and not worry about how the pdf is being created.

#### Inheritance 

Inheritance is the process by which one class takes on the attributes and methods of another, and it's used to express an is-a relationship. For example, Ruby is a programming language, so a ``` RubyLanguage ``` class could inherit from a ``` ProgrammingLanguage ``` class.

```ruby
class ProgrammingLanguage
  def is_object_oriented
    true
  end
end

class RubyLanguage < ProgrammingLanguage
end

class PythonLanguage < ProgrammingLanguage
end
```

##### Polymorphism

Inheritance is one way of achieving polymorphism, which is essentially providing the same interface for different forms (data types). In the previous example, both subclasses have access to the ``` is_object_oriented ``` method.

```ruby
class Shape 
  def draw
    puts 'drawing the shape to the screen'
  end
end

class Square < Shape
end

class Circle < Shape
end

square = Square.new
circle = Circle.new

square.draw
circle.draw
```

##### Duck typing

> Duck typing is concerned with establishing the suitability of an object for some purpose. With normal typing, suitability is assumed to be determined by an object's type only. In duck typing, an object's suitability is determined by the presence of certain methods and properties (with appropriate meaning), rather than the actual type of the object.

> In Ruby, we rely less on the type (or class) of an object and more on its capabilities. Hence, Duck Typing means an object type is defined by what it can do, not by what it is. Duck Typing refers to the tendency of Ruby to be less concerned with the class of an object and more concerned with what methods can be called on it and what operations can be performed on it. In Ruby, we would use respond_to? or might simply pass an object to a method and know that an exception will be raised if it is used inappropriately.

#### Overriding methods

```ruby
class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

class Dragon < Creature
    def fight
        return "Breathes fire!" 
    end
end
```

#### Subclasses and Superclasses

Subclasses are the derived classes from inheriting from the parent, or "superclass"

When you call ``` super ``` from inside a method, that tells Ruby to look in the superclass of the current class and find a method with the same name as the one from which super is called. If it finds it, Ruby will use the superclass' version of the method.

```ruby
class Creature
  def initialize(name)
    @name = name
  end
  
  def fight
    return "Punch to the chops!"
  end
end

# Add your code below!
class Dragon < Creature
    def fight
        puts "Instead of breathing fire..."
        super
    end
end
```

#### Code to an interface 

> Question: What to you is the challenge in developing objects? 

Tips: 
* Think about the interface you want to interact with 
* Are there commonalities among multiple objects? Think inheritance 
* Are there methods that should not be overwritten or public?

## Class Exercise

**15 min**

https://gist.github.com/mdang/256205908f9524a1f124

### self

The keyword ``` self ``` refers to the current object instance. 

```ruby
# Using 'self' to create a class method
class Person
  @@crowd = 0

  def initialize
    @@crowd += 1
  end

  def self.population
    @@crowd
  end
end
```

```
> a = Person.new("Aaron")
  => #<Person:0x344h9@name="Aaron">
> b = Person.new("Bill")
  => #<Person:0x984k2@name="Bill">
> c = Person.new("Charlie")
  => #<Person:0x8fj83@name="Charlie">
> Person.population
  => 3
```

```ruby
# Using self to refer to another method within the same class
class Shape 
  def draw
    puts "i am drawing a #{@shape}"
  end

  def test
  	puts "test got called"
  end
end

class Square < Shape
	def initialize
		@shape = 'square'
	end

	def call_me
		self.test
	end
end

class Circle < Shape
	def initialize
		@shape = 'circle'
	end
end

square = Square.new
circle = Circle.new

square.draw
circle.draw

square.call_me
```

### Public, private, protected

Private methods allow us to separate the private implementation from the public interface. 

Note: ``` private ``` methods **can't** be called with the ``` self ``` keyword, whereas ``` public ``` and ``` protected ``` methods can be. However, we don't need to preface ``` self. ``` when calling these methods in a class. 

### to_s

Use to override what is output when you puts an object

```ruby
class Name
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def full_name
    @first_name + ' ' + @last_name
  end

  def to_s
    full_name
  end      
end

name = Name.new 'Mike', 'Dang'
puts name
```

### require vs require_relative

Use ``` require ``` to load files in the default library path (e.g. gem install ..). 

Use ``` require_relative ``` to load files relative to the current file's location

```ruby
require_relative "misc/another_file"
```

## Class Exercise

Using Facebook posts as an example, model out the different types of posts with a generic post class, what kind of attributes would be included in each one, inheritance, etc.

## Bonus

### Modules/Mixins vs Inheritance

When a module is used to mix additional behavior and information into a class, it's called a mixin. Mixins allow us to customize a class without having to rewrite code.

http://stackoverflow.com/questions/1282864/ruby-inheritance-vs-mixins

```ruby
module MartialArts
    def swordsman
       puts "I'm a swordsman." 
    end
end

class Ninja
  include MartialArts
  def initialize(clan)
    @clan = clan
  end
end

class Samurai
  include MartialArts
  def initialize(shogun)
    @shogun = shogun
  end
end

```

##### includes vs require 

> The include and require methods do very different things.

> The require method does what include does in most other programming languages: run another file. It also tracks what you've required in the past and won't require the same file twice. To run another file without this added functionality, you can use the load method.

> The include method takes all the methods from another module and includes them into the current module. This is a language-level thing as opposed to a file-level thing as with require. The include method is the primary way to "extend" classes with other modules (usually referred to as mix-ins). For example, if your class defines the method "each", you can include the mixin module Enumerable and it can act as a collection. This can be confusing as the include verb is used very differently in other languages.

##### extend keyword

Whereas ``` include ``` mixes a module's methods in at the instance level (allowing instances of a particular class to use the methods), the extend keyword mixes a module's methods at the class level.

```ruby
module Foo
  def foo
    puts 'heyyyyoooo!'
  end
end

class Bar
  include Foo
end

Bar.new.foo # heyyyyoooo!
Bar.foo # NoMethodError: undefined method ‘foo’ for Bar:Class

class Baz
  extend Foo
end

Baz.foo # heyyyyoooo!
Baz.new.foo # NoMethodError: undefined method ‘foo’ for #<Baz:0x1e708>
```

Above, include makes the foo method available to an instance of a class and extend makes the foo method available to the class itself.
