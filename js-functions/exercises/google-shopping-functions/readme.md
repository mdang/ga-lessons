#JavaScript Functions

Using the google shoping data used before (also included in this repository) create some useful functions to answer the following questions.

**REMEMBER:** data should be passed in to the function as arguments and out as a return value. DO NOT access/modify variables defined outside of the function.

##Getting Started

* Write code in google_shopping_functions.js

##Deliverables

Create the following functions.

##1.) getItems(objectData)

* **input:** json object
* **returns:** an array of items

Create a function called `getItems` that simply returns the items array from the google product object.

**Note** all other functions (below) use the return of this function as their input.

##2.) getItemsByBrand(items, brand)

* **input:** an array of items, a string of a brand to filter with
* **returns:** an array of items (of a specific brand)

Create a function called `getItemsByBrand` that takes an item array returns a new array of all items of a specified brand.

Test this function by searching for Sony, Canon, Nikon and Panasonic.


##3.) getItemsByAuthor(items, author)

* **input:** an array of items, a string of an author to filter with
* **returns:** an array of items (of a specific author)

Create a function called `getItemsByAuthor` that takes an item array and returns a new array of all items by a specified author.

Test this function by searching for Target, CDW, eBay

##4.) getAvailableProducts(items)

* **input:** an array of items
* **returns:** an array of items (that are available)

Create function called `getAvailableProducts` that takes an item array and returns an array containing all of the available products (an available product is one with at least one availability of "inStock" in the inventories array)


##5.) Use your functions

Use the functions you created in 1 - 5 to ouput (console.log) the following lists of items.

* All items made by Sony.
* All items made by Sony that are available.
* All available items by the author "Adorama Camera"
* All items made by Nikon with the author eBay.



**Example Function Usage**

```js

//verbose -- outputs all cannon products
var items = getItems(data);
var cannonItems = getItemsByBrand(items, 'Cannon');
console.log(cannonItems);

//single line version -- does the same as above
console.log(getItemsByBrand(getItems(data), 'Cannon'));
```


##Bonus

Create another search function and/or think of other interesting ways to combine the functions to preform useful searches.

---

## Licensing
1. All content is licensed under a CC-BY-NC-SA 4.0 license.
2. All software code is licensed under GNU GPLv3. For commercial use or alternative licensing, please contact legal@ga.co.
