'use strict';

var WDI_DTLA_6 = [
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

function friends4eva(friends) {
  'use strict';
  let buds4eva = '';
  friends.forEach((e,i) => {
    if (i !== friends.length-1) {
      buds4eva += `${e} and `
    } else {
      buds4eva += `${e} are programming buds foreva!`
    }
  });
  return buds4eva;
}
