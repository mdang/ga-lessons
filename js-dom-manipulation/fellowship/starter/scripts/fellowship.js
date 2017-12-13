// Dramatis Personae
var fellowship = {
  hobbits: [
    "Frodo Baggins",
    "Samwise 'Sam' Gamgee",
    "Meriadoc \"Merry\" Brandybuck",
    "Peregrin 'Pippin' Took"
  ],

  buddies: [
    "Gandalf the Grey",
    "Legolas",
    "Gimli",
    "Strider",
    "Boromir"
  ],

  lands: [
    "The Shire", "Rivendell", "Mordor"
  ],

  makeMiddleEarth: function() {
    // create a section tag with an id of middle-earth
    // add each land as an article tag
    // inside each article tag include an h1 with the name of the land
    // append middle-earth to your document body
  },

  makeHobbits: function() {
    // display an unordered list of hobbits in the shire
    // give each hobbit a class of hobbit
  },

  keepItSecretKeepItSafe: function() {
    // create a div with an id of 'the-ring'
    // give the div a class of 'magic-imbued-jewelry'
    // add an event listener so that when a user clicks on the ring, the nazgulScreech function (provided) is invoked
    // add the ring as a child of Frodo
  },

  makeBuddies: function() {
    // create an aside tag
    // display an unordered list of buddies in the aside
    // insert your aside before rivendell
  },

  beautifulStranger: function() {
    // change the buddy 'Strider' textnode to "Aragorn"
  },

  leaveTheShire: function() {
    // assemble the hobbits and move them to Rivendell
  },

  forgeTheFellowShip: function() {
    // move the hobbits and the buddies to Rivendell
    // create a new div called 'the-fellowship'
    // add each hobbit and buddy one at a time to 'the-fellowship'
    // after each character is added make an alert that they have joined your party
  },

  theBalrog: function() {
    // change the 'Gandalf' textNode to 'Gandalf the White'
    // apply style to the element
    // make the background 'white', add a grey border
  },

  hornOfGondor: function() {
    // pop up an alert that the horn of gondor has been blown
    // Boromir's been killed by the Uruk-hai!
    // put a linethrough on boromir's name
    // Remove Boromir from the Fellowship
  },

  itsDangerousToGoAlone: function() {
    // take Frodo and Sam out of the fellowship and move them to Mordor
    // add a div with an id of 'mount-doom' to Mordor
  },

  weWantsIt: function() {
    // Create a div with an id of 'gollum' and add it to Mordor
    // Remove the ring from Frodo and give it to Gollum
    // Move Gollum into Mount Doom
  },

  thereAndBackAgain: function() {
    // remove Gollum and the Ring from the document
    // remove all the baddies from the document
    // Move all the hobbits back to the shire
  }
}
