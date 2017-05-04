# Python OOP

### Learning Objectives

## Functions

A function can take any number and type of input parameters and return any
number and type of output results.

```python
def do_nothing():
  pass
  
do_nothing();
```

### Positional Arguments

```python
def menu(wine, entree, dessert):
  return {'wine': wine, 'entree': entree, 'dessert': dessert}

menu('chardonnay', 'chicken', 'cake')
```

### Keyword Arguments

```python
def menu(wine, entree, dessert):
  return {'wine': wine, 'entree': entree, 'dessert': dessert}
  
menu(entree='beef', dessert='bagel', wine='bordeaux')
```

### Default Parameter Values

```python
def menu(wine, entree, dessert='pudding'):
  return {'wine': wine, 'entree': entree, 'dessert': dessert}
```

### Docstrings

```python
def echo(anything):
  'echo returns its input argument'
  return anything
```

```python
def print_if_true(thing, check):
  '''
  Prints the first argument if a second argument is true.
  The operation is:
  1. Check whether the *second* argument is true.
  2. If it is, print the *first* argument.
  '''
  if check:
    print(thing)
```

