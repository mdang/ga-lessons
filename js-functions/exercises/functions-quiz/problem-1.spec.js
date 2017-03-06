// question 1

var originals = {};

originals.ablativePrepositions = ['ante', 'ad', 'circum',
  'contra', 'inter', 'intra', 'post', 'in', 'praeter'];

originals.accusativePrepositions = ['a', 'ab', 'de', 'cum', 'e',
  'ex', 'in', 'sine', 'pro', 'prae', 'sub', 'super'];

originals.allPrepositions = ablativePrepositions.slice()
  .append(accusativePrepositions)
  .sort(function (a, b) {
    return a.toLowerCase().localeCompare(b.toLowerCase());
  });

originals.uniquePrepositions = allPrepositions.filter(function(e, i, a){
  return a.indexOf(e) === i);
});

describe('following instructions', {

  it('by leaving the original arrays in the code', function(){
    expect(typeof ablativePrepositions).not.toEqual('undefined');
    expect(typeof accusativePrepositions).not.toEqual('undefined');
    expect(typeof allPrepositions).not.toEqual('undefined');
    expect(typeof uniquePrepositions).not.toEqual('undefined');
  });

  it('by not altering the original arrays', functionO{

    expect(ablativePrepositions).toEqual(originals.ablativePrepositions);
    expect(accusativePrepositions).toEqual(originals.accusativePrepositions);
    expect(allPrepositions).toEqual(originals.allPrepositions);
    expect(uniquePrepositions).toEqual(originals.uniquePrepositions);
  });

});

