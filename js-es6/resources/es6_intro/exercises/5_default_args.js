// |||||||||||||||||||||||||||||||||||
// ||||||||| CHANGE TO ES6 |||||||||||
// |||||||||||||||||||||||||||||||||||

// 5. DEFAULT ARGUMENTS

var notBuds = ['Jaws', 'Quint', 'Hooper'];

// change business to "sushi shop" and budNum to the length of futureBuds!

function buds4Life(futureBuds, budNum, business) {
  var buds = '';
  futureBuds.forEach((bud, index) => {
    if(index !== futureBuds.length - 1) {
      buds += bud + " and ";
    } else {
      buds += bud + " are best buds! They co-own a " + business + " with " +
              budNum + " partners.";
    }
  });
  console.log(buds);
}

buds4Life(notBuds, 3, 'sushi shop');
