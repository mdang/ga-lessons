// 2. BLOCK SCOPE

'use strict';

// This variable should not be reassignable.
const shrek = "ogre";

// This variable should be accessible outside of the block scope
var fiona = "princess";

fiona = shrek;

if (fiona === "ogre") {
  // This variable should only be valid in this block.
  let thePeople = "scared";
  console.log(thePeople);  // scared

  // This variable should only be valid in this block and should not be reassignable.
  const farquad = "dufus";
  console.log(farquad); // dufus
}


console.log(shrek); // ogre
console.log(fiona); // ogre

try {
  // Trying to change the value of `thePeople`
  thePeople = "we want a sequel";
} catch (err) {
  // but an `thePeople is not defined` error should occur.
  console.log(err);
}
