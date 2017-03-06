## Pet / Owner Objects (30 mins)


1. Suppose that we wanted to create a browser-based calendar program for keeping track of things. Identify at least two entites such a program might need and describe attributes and methods of each.

> Example #1

```
Description: Our app manages car sales.
Entity: Car
Attributes: make, model, year
Methods: drive, brake, park
```

> Example #2

```
Entity: SalesPerson
Attributes: name, commissionRate
Methods: sell, call

```

2\. Create an object literal that lines up with the following `owner` entity description.

Store it in a variable `owner`. Be sure to give it reasonable values for each of its properties.

```
Entity: owner
Attributes: name, address, numberOfPets
```


3. Create an object literal that lines up with the following `pet` entity description.

Store it in a variable `pet`.

```
Entity: Pet
Attributes: name, species, breed, vocalization
Methods: vocalize
```


4. Create a constructor function for pet objects, as described above. The constructor function should be responsible for setting the values of `name`, `species`, `breed`, and `vocalization`.