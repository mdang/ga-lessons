// 4. REST AND SPREAD PARAMETERS

function friendship(v, w, x, y, z) {
  console.log(v + ', ' + w + ', ' + x + ', ' + y + ', and ' + z + ' are all buds!');
}

var notFriends = ['Coraline', 'Wybie'];

friendship('Bobinsky', ...notFriends, 'The Cat', 'Miss Miriam Forcible');

var alreadyFriends = ['Bobinsky', 'The Cat', 'Miss Miriam Forcible']

alreadyFriends.push(...notFriends);
