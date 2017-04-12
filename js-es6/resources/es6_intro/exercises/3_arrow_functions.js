// |||||||||||||||||||||||||||||||||||
// ||||||||| CHANGE TO ES6 |||||||||||
// |||||||||||||||||||||||||||||||||||

// 3. ARROW FUNCTIONS

'use strict';

var lydia = {
  esp: function() {
    this.friends = '';
    var spookyGirl = this;
    setImmediate(function() {
      spookyGirl.friends = "ghosts";
      console.log(spookyGirl.friends)
    });
  }
};

lydia.esp();
