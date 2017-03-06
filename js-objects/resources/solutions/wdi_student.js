var wdiStudent = {
  name: 'Charlie Kelly',
  squad: 'Paddys',
  classesTaken: ['git intro', 'cli', 'css' ],
  numberOfTardies: 0,
  favoriteFood: 'Milksteak',
  enrolled: true,
  hobby: 'Magnet'
}

// Update two existing properties
wdiStudent['numberOfTardies'] += 1;
wdiStudent.classesTaken.push('js-basics');

// Add a new property
wdiStudent.roommate = 'Frank';

// Delete one attribute
delete wdiStudent.hobby;

// Iterate through and log key-value pairs
for (attr in wdiStudent){
  console.log('The key ' + attr + ' has the value ' + wdiStudent[attr]);
}

