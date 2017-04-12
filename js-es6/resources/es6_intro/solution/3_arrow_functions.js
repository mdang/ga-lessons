// 3. ARROW FUNCTIONS

'use strict';

var lydia = {
  esp: function(){
    this.friends = '';
    setImmediate(() => {
      this.friends = "ghosts";
      console.log(this.friends)
    });
  }
};

lydia.esp();
