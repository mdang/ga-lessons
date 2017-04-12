// 5. DEFAULT ARGUMENTS

'use strict';

let notBuds = ['Jaws', 'Quint', 'Hooper'];

const buds4Life = (futureBuds, budNum = futureBuds.length, business = 'sushi shop') => {
  let buds = '';
  futureBuds.forEach((e,i) => {
    if (i !== futureBuds.length - 1) {
      buds += `${e} and `;
    } else {
      buds += `${e} are best buds! They co-own a ${business} with ${budNum} partners.`;
    }
  });
  console.log(buds);
}

buds4Life(notBuds);
