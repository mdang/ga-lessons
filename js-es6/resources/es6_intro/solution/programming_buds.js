'use strict';

let scaryNewPeeps = [
  'Adam',
  'Alex',
  'Andrew',
  'Anthony',
  'Ben',
  'Chris',
  'Ferdie',
  'Fernando',
  'Gev',
  'James E.',
  'James M.',
  'Jason',
  'Jeffrey',
  'Jessica',
  'Joey',
  'Judd',
  'Lindsey',
  'Matt',
  'Max',
  'Melissa',
  'Mike',
  'Rachel',
  'Richard',
  'Taco',
  'Sebastian',
  'Tara',
  'Wayne'
];

let friends4eva = friends => {
  let buds4eva = '';
  friends.forEach((bud,index) => {
    if (index !== friends.length-1) {
      buds4eva += `${bud} and `
    } else {
      buds4eva += `${bud} are programming buds foreva!`
    }
  });
  return buds4eva;
}

export default {
  scaryNewPeeps: scaryNewPeeps,
  friends4eva: friends4eva
};
