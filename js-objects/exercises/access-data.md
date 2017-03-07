# Accessing Data from an Object

Below is a truncated version of WDI 938's cohort data. The `data` object is a grouping of key-value pairs that describes the class.  Take some time to study the structure and the data types within the data object. It's a bit more complex.

```javascript
var data = {
	school: "General Assembly",
	city: "Austin",
	course: "Web Development Immersive",
	course_id: "WDI938",
	classroom: "2",
	students: [{
		id: 124140,
		lastName: "Silva",
		firstName: "Greice"
	}, {
		id: 421124,
		lastName: "Arellano",
		firstName: "Ricardo"
	}, {
		id: 824544,
		lastName: "Cusimano",
		firstName: "Zach"
	}]
}

```

<details>
  <summary>What data type is the value associated with the `students` key in the `data` object?</summary>
  <p>
  The `students` attribute is an array!
  </p>
</details>

<details>
  <summary>What data type are the elements within `students`?</summary>
  <p>
    They are objects!
  </p>
</details>  

<details>
  <summary>What data type are the elements within `students`?</summary>
  <p>
  The `students` array contains objects as its elements!
  </p>
</details>

To access a property, we can use dot-notation or bracket-notation on the key to have the corresponding value returned.

<details>
  <summary>How would you access the `students` attribute of the `data` object?</summary>
  <p>
  ```javascript
  data.students
  ```
  </p>
</details>

To access an array within an object,  the method is similar to accessing any other property.  The property `students` is an array of Objects.  To access that array and assign it to a variable, we simply perform the following:

 ```javascript
 var studentArray = data.students; //students
 ```
The `data.students` array is now accessible by using `studentArray` instead. We can access the first array element using bracket notation:  `studentArray[0]` or `data.students[0]`.

<details>
  <summary>How would you access Zach's data from within the `data` object?</summary>
  <p>
  ```javascript
    data.students[2]
  ```
  </p>
</details>

<details>
  <summary>How would you access Ricardo's student id?</summary>
  <p>
  ```javascript
    data.students[1].id;
  ```
  </p>
</details>

<details>
  <summary>How would you access Greice's last name?</summary>
  <p>
  ```javascript
    data.students[0].lastName;
  ```
  </p>
</details>
