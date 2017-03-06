
You've gotten a promotion at that prestigious firm, and an intern comes to you for help with a project due tomorrowq.  He's completely misunderstood his assingment and built a complicated web form and supporting Javascript that takes input through a GUI and turns it into an object:

var matchObject = {
  isRed: true,
  isMetal: true,
  isLightweight: false
};

But as he discovered when he tried to pass it to the API of his research database, the API expected a function.

He did hack it, he tells you, and found out that, for the query he recorded in his object, he could pass the following function:

var matchObjectFunction = function(testObject) {
  return testObject.isRed && testObject.isMetal && !testObject.isLightweight;
};

"I didn't even know you could pass functions as arguments until this morning!" he says.  "I am so doomed.  It will take years to change all that code!"

"No, it won't," you say.

Write a function that solves the intern's problem for him: it takes an object modelObject like the intern's objects, with attribtes that have the values true and false, and returns a function that tests those attributes on the object passed in to it: if the attributes are true in the modelObject, they should be present and truthy in the passed-in object, and if they are false in the modelObject, they should either be not present or present and falsy in the passed-in object.
